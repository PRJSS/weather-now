//
//  TodayViewController.swift
//  Weather Now
//
//  Created by Бернат Данила on 01.04.2022.
//

import UIKit
import CoreLocation

class TodayViewController: UIViewController {
    
    let mainWeatherImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "sun.max"))
        imageView.tintColor = .orange
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let mainWeatherInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.textColor = .systemBlue
        return label
    }()
    
    let cloudinessImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "drop"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let cloudinessLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let probabilityOfCloudinessImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "cloud.hail"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let probabilityOfCloudinessLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let pressureImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "speedometer"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let windSpeedImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "wind"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let windDirectionImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "safari"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let windDirectionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = button.titleLabel!.font.withSize(25)
        return button
    }()
    
    var viewModel: TodayViewModel! {
        didSet {
            self.locationLabel.text = viewModel.location
            self.mainWeatherInfoLabel.text = viewModel.temperatureAndCondition
            self.cloudinessLabel.text = viewModel.rain
            self.probabilityOfCloudinessLabel.text = viewModel.cloudiness
            self.pressureLabel.text = viewModel.pressure
            self.windSpeedLabel.text = viewModel.windSpeed
            self.windDirectionLabel.text = viewModel.windDeg
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupSubviews()
        viewModel = TodayViewModel()
        
        
        LocationManager.shared.getUserLocation { [weak self] location in
            self!.viewModel.locationData.longitude = location.coordinate.longitude
            self!.viewModel.locationData.latitude = location.coordinate.latitude
            self!.viewModel.networkWeatherManager.fetchCurrentWeather(latitude: self!.viewModel.latitude, longitude: self!.viewModel.longitude)
            self!.viewModel.networkWeatherManager.onComplition = { currentWeather in
                DispatchQueue.main.sync {
                self!.viewModel.currentWeather = currentWeather
                }
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        //viewModel.networkWeatherManager.fetchCurrentWeather(latitude: viewModel.locationData.latitude, longitude: viewModel.locationData.longitude)
//        viewModel.networkWeatherManager.onComplition = { currentWeather in
//            self.viewModel.currentWeather = currentWeather
//        }
    }
    

    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        
        ///layout subviews
        layoutMainWeatherImage()
        layoutLocationLabel()
        layoutMainWeatherInfoLabel()
        layoutCloudinessImage()
        layoutProbabilityOfCloudinessImage()
        layoutPressureImage()
        layoutWindSpeedImage()
        layoutWindDirectionImage()
        layoutCloudinessLabel()
        layoutProbabilityOfCloudinessLabel()
        layoutPressureLabel()
        layoutWindSpeedLabel()
        layoutWindDirectionLabel()
        layoutShareButton()
    }
    
    private func layoutLocationLabel() {
        view.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: mainWeatherImage.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            locationLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func layoutMainWeatherImage() {
        view.addSubview(mainWeatherImage)
        mainWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainWeatherImage.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            mainWeatherImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            mainWeatherImage.widthAnchor.constraint(equalToConstant: 130),
            mainWeatherImage.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func layoutMainWeatherInfoLabel() {
        view.addSubview(mainWeatherInfoLabel)
        mainWeatherInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainWeatherInfoLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            mainWeatherInfoLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
    }
    
    private func layoutCloudinessImage() {
        view.addSubview(cloudinessImage)
        cloudinessImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cloudinessImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            cloudinessImage.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
        ])
    }
    
    private func layoutProbabilityOfCloudinessImage() {
        view.addSubview(probabilityOfCloudinessImage)
        probabilityOfCloudinessImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            probabilityOfCloudinessImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            probabilityOfCloudinessImage.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor,constant: 60),
        ])
    }
    
    private func layoutPressureImage() {
        view.addSubview(pressureImage)
        pressureImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pressureImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            pressureImage.leftAnchor.constraint(equalTo: cloudinessImage.rightAnchor,constant: 80)
        ])
    }
    
    private func layoutWindSpeedImage() {
        view.addSubview(windSpeedImage)
        windSpeedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windSpeedImage.topAnchor.constraint(equalTo: cloudinessImage.bottomAnchor, constant: 50),
            windSpeedImage.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 110)
        ])
    }
    
    private func layoutWindDirectionImage() {
        view.addSubview(windDirectionImage)
        windDirectionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windDirectionImage.topAnchor.constraint(equalTo: cloudinessImage.bottomAnchor, constant: 50),
            windDirectionImage.leftAnchor.constraint(equalTo: windSpeedImage.leftAnchor, constant: 110),
        ])
    }
    
    private func layoutCloudinessLabel() {
        view.addSubview(cloudinessLabel)
        cloudinessLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cloudinessLabel.topAnchor.constraint(equalTo: cloudinessImage.bottomAnchor, constant: 5),
            cloudinessLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
        ])
    }
    
    
    private func layoutProbabilityOfCloudinessLabel() {
        view.addSubview(probabilityOfCloudinessLabel)
        probabilityOfCloudinessLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            probabilityOfCloudinessLabel.topAnchor.constraint(equalTo: probabilityOfCloudinessImage.bottomAnchor, constant: 5),
            probabilityOfCloudinessLabel.centerXAnchor.constraint(equalTo: probabilityOfCloudinessImage.centerXAnchor),
        ])
    }
    
    private func layoutPressureLabel() {
        view.addSubview(pressureLabel)
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pressureLabel.topAnchor.constraint(equalTo: pressureImage.bottomAnchor, constant: 5),
            pressureLabel.centerXAnchor.constraint(equalTo: pressureImage.centerXAnchor)
        ])
    }
    
    private func layoutWindSpeedLabel() {
        view.addSubview(windSpeedLabel)
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windSpeedLabel.topAnchor.constraint(equalTo: windSpeedImage.bottomAnchor, constant: 5),
            windSpeedLabel.centerXAnchor.constraint(equalTo: windSpeedImage.centerXAnchor)
        ])
    }
    
    private func layoutWindDirectionLabel() {
        view.addSubview(windDirectionLabel)
        windDirectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windDirectionLabel.topAnchor.constraint(equalTo: windDirectionImage.bottomAnchor, constant: 5),
            windDirectionLabel.centerXAnchor.constraint(equalTo: windDirectionImage.centerXAnchor),
        ])
    }
    
    private func layoutShareButton() {
            view.addSubview(shareButton)
            shareButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                shareButton.topAnchor.constraint(lessThanOrEqualTo: windDirectionLabel.bottomAnchor, constant: 100),
                shareButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
            ])
        }
    
    
    
}
