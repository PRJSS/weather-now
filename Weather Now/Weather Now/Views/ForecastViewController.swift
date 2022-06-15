//
//  ForecastViewController.swift
//  Weather Now
//
//  Created by Бернат Данила on 06.04.2022.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    var forecastTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private var viewModel: ForecastViewModel! {
        didSet {
            self.title = viewModel.forecastWeather?.cityName
            self.tabBarItem.title = "Forecast"
            self.forecastTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forecastTableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "ForecastTableViewCell")
        forecastTableView.dataSource = self
        viewModel = ForecastViewModel()
        updateForecast()
        setupSubviews()
    }
    
    private func updateForecast() {
        
        if let loc = LocationManager.shared.manager.location {
            self.viewModel.locationData.longitude = loc.coordinate.longitude
            self.viewModel.locationData.latitude = loc.coordinate.latitude
            print("1. forecast updated")
            
            viewModel.networkWeatherManager.fetchForecastWeather(latitude: viewModel.latitude, longitude: viewModel.longitude) { [weak self] forecastWeather in
                print("3. fetched")
                DispatchQueue.main.async {
                    self?.viewModel.forecastWeather = forecastWeather
                    print("4. saved forecast")
                    
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.forecastWeather?.days.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.forecastWeather?.days[section].Weather3HList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ForecastTableViewCell()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        
        layoutForecastTableView()
    }
    
    private func layoutForecastTableView() {
        view.addSubview(forecastTableView)
        forecastTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forecastTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            forecastTableView.leftAnchor.constraint(equalTo:view.leftAnchor),
            forecastTableView.rightAnchor.constraint(equalTo:view.rightAnchor),
            forecastTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor)
        ])
    }
    
}
