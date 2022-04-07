//
//  TodayViewController.swift
//  Weather Now
//
//  Created by Бернат Данила on 01.04.2022.
//

import UIKit

class TodayViewController: UIViewController {
    
    var viewModel: ViewModel = ViewModel()
    
    let mainWeatherImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "sun.max"))
        imageView.tintColor = .orange
        return imageView
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
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = button.titleLabel!.font.withSize(25)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        
        ///layout subviews
        layoutMainWeatherImage()
        layoutLocationLabel()
        layoutMainWeatherInfoLabel()
        layoutPrecipitationImage()
        layoutProbabilityOfPrecipitationImage()
        layoutPressureImage()
        layoutWindSpeedImage()
        layoutWindDirectionImage()
        layoutPrecipitationLabel()
        layoutProbabilityOfPrecipitationLabel()
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
    
    private func layoutPrecipitationImage() {
        view.addSubview(precipitationImage)
        precipitationImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            precipitationImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            precipitationImage.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
        ])
    }
    
    private func layoutProbabilityOfPrecipitationImage() {
        view.addSubview(probabilityOfPrecipitationImage)
        probabilityOfPrecipitationImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            probabilityOfPrecipitationImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            probabilityOfPrecipitationImage.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor,constant: 60),
        ])
    }
    
    private func layoutPressureImage() {
        view.addSubview(pressureImage)
        pressureImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pressureImage.topAnchor.constraint(equalTo: mainWeatherInfoLabel.bottomAnchor, constant: 30),
            pressureImage.leftAnchor.constraint(equalTo: precipitationImage.rightAnchor,constant: 80)
        ])
    }
    
    private func layoutWindSpeedImage() {
        view.addSubview(windSpeedImage)
        windSpeedImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windSpeedImage.topAnchor.constraint(equalTo: precipitationImage.bottomAnchor, constant: 50),
            windSpeedImage.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 110)
        ])
    }
    
    private func layoutWindDirectionImage() {
        view.addSubview(windDirectionImage)
        windDirectionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windDirectionImage.topAnchor.constraint(equalTo: precipitationImage.bottomAnchor, constant: 50),
            windDirectionImage.leftAnchor.constraint(equalTo: windSpeedImage.leftAnchor, constant: 110),
        ])
    }
    
    private func layoutPrecipitationLabel() {
        view.addSubview(precipitationLabel)
        precipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            precipitationLabel.topAnchor.constraint(equalTo: precipitationImage.bottomAnchor, constant: 5),
            precipitationLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
        ])
    }
    
    
    private func layoutProbabilityOfPrecipitationLabel() {
        view.addSubview(probabilityOfPrecipitationLabel)
        probabilityOfPrecipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            probabilityOfPrecipitationLabel.topAnchor.constraint(equalTo: probabilityOfPrecipitationImage.bottomAnchor, constant: 5),
            probabilityOfPrecipitationLabel.centerXAnchor.constraint(equalTo: probabilityOfPrecipitationImage.centerXAnchor),
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

