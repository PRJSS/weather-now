//
//  ViewController.swift
//  Weather Now
//
//  Created by Бернат Данила on 01.04.2022.
//

import UIKit

class TodayViewController: UIViewController {
    
    var viewModel: ViewModel = ViewModel()
    
    let mainWeatherImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "sun.max"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "London, UK"
        label.textAlignment = .center
        return label
    }()
    
    let mainWeatherInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "22ºC | Sunny"
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.textColor = .systemBlue
        return label
    }()
    
    let precipitationImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "drop"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let precipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "1.0 mm"
        label.textAlignment = .center
        return label
    }()
    
    let probabilityOfPrecipitationImage: UIImageView = {
        let iamgeView = UIImageView(image: UIImage(systemName: "cloud.hail"))
        iamgeView.tintColor = .orange
        return iamgeView
    }()
    
    let probabilityOfPrecipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "57%"
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
        label.text = "1019 hPa"
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
        label.text = "20 km/h"
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
        label.text = "SE"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainWeatherImage)
        view.addSubview(locationLabel)
        view.addSubview(mainWeatherInfoLabel)
        view.addSubview(precipitationImage)
        view.addSubview(probabilityOfPrecipitationImage)
        view.addSubview(pressureImage)
        view.addSubview(windSpeedImage)
        view.addSubview(windDirectionImage)
        view.addSubview(precipitationLabel)
        view.addSubview(probabilityOfPrecipitationLabel)
        view.addSubview(pressureLabel)
        view.addSubview(windSpeedLabel)
        view.addSubview(windDirectionLabel)
        
        // Constraints
        let margins = view.layoutMarginsGuide
        mainWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        mainWeatherInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        precipitationImage.translatesAutoresizingMaskIntoConstraints = false
        probabilityOfPrecipitationImage.translatesAutoresizingMaskIntoConstraints = false
        pressureImage.translatesAutoresizingMaskIntoConstraints = false
        windSpeedImage.translatesAutoresizingMaskIntoConstraints = false
        windDirectionImage.translatesAutoresizingMaskIntoConstraints = false
        precipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        probabilityOfPrecipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        windDirectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //images
            mainWeatherInfoLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            mainWeatherInfoLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            mainWeatherImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            mainWeatherImage.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            mainWeatherImage.widthAnchor.constraint(equalToConstant: 130),
            mainWeatherImage.heightAnchor.constraint(equalToConstant: 130),
            locationLabel.topAnchor.constraint(equalTo: mainWeatherImage.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            locationLabel.widthAnchor.constraint(equalTo: margins.widthAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            precipitationImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            precipitationImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            probabilityOfPrecipitationImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            probabilityOfPrecipitationImage.leftAnchor.constraint(equalTo: margins.leftAnchor,constant: 60),
            pressureImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            pressureImage.leftAnchor.constraint(equalTo: precipitationImage.rightAnchor,constant: 80),
            windSpeedImage.topAnchor.constraint(equalTo: precipitationImage.bottomAnchor, constant: 50),
            windSpeedImage.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 110),
            windDirectionImage.topAnchor.constraint(equalTo: precipitationImage.bottomAnchor, constant: 50),
            windDirectionImage.leftAnchor.constraint(equalTo: windSpeedImage.leftAnchor, constant: 110),
            
            //labels
            precipitationLabel.topAnchor.constraint(equalTo: precipitationImage.bottomAnchor, constant: 5),
            precipitationLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            probabilityOfPrecipitationLabel.topAnchor.constraint(equalTo: probabilityOfPrecipitationImage.bottomAnchor, constant: 5),
            probabilityOfPrecipitationLabel.centerXAnchor.constraint(equalTo: probabilityOfPrecipitationImage.centerXAnchor),
            pressureLabel.topAnchor.constraint(equalTo: pressureImage.bottomAnchor, constant: 5),
            pressureLabel.centerXAnchor.constraint(equalTo: pressureImage.centerXAnchor),
            windSpeedLabel.topAnchor.constraint(equalTo: windSpeedImage.bottomAnchor, constant: 5),
            windSpeedLabel.centerXAnchor.constraint(equalTo: windSpeedImage.centerXAnchor),
            windDirectionLabel.topAnchor.constraint(equalTo: windDirectionImage.bottomAnchor, constant: 5),
            windDirectionLabel.centerXAnchor.constraint(equalTo: windDirectionImage.centerXAnchor)
        ])
    }
    
    
}

