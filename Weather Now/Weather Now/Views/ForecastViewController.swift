//
//  ForecastViewController.swift
//  Weather Now
//
//  Created by Бернат Данила on 06.04.2022.
//

import UIKit

class ForecastViewController: UIViewController {
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        label.textAlignment = .center
        label.backgroundColor = .green
        return label
    }()
    
    private var viewModel: ForecastViewModel! {
        didSet {
            self.locationLabel.text = viewModel.location
            //            self.mainWeatherImage.image = UIImage(systemName: viewModel.image)
            //            self.locationLabel.text = viewModel.location
            //            self.mainWeatherInfoLabel.text = "\(viewModel.temperature) | \(viewModel.mainCondition)"
            //            self.cloudinessLabel.text = viewModel.rain
            //            self.probabilityOfCloudinessLabel.text = viewModel.cloudiness
            //            self.pressureLabel.text = viewModel.pressure
            //            self.windSpeedLabel.text = viewModel.windSpeed
            //            self.windDirectionLabel.text = viewModel.windDeg
            //            self.dateLabel.text = viewModel.date
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationLabel)
        
        viewModel = ForecastViewModel()
        
        updateForecast()
    }
    
    
    
    private func updateForecast() {
        LocationManager.shared.getUserLocation { [weak self] location in
            self!.viewModel.locationData.longitude = location.coordinate.longitude
            self!.viewModel.locationData.latitude = location.coordinate.latitude
            self!.viewModel.networkWeatherManager.fetchForecastWeather(latitude: self!.viewModel.latitude, longitude: self!.viewModel.longitude)
            self!.viewModel.networkWeatherManager.forecastWeatherOnComplition = { forecastWeather in
                DispatchQueue.main.sync {
                    self!.viewModel.forecastWeather = forecastWeather
                }

            }
        }
    }
}
