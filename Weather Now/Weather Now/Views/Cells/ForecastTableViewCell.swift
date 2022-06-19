//
//  ForecastTableViewCell.swift
//  Weather Now
//
//  Created by Бернат Данила on 07.06.2022.
//

import Foundation
import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    let mainWeatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .orange
        return imageView
    }()
    
    var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(40)
        label.textColor = .systemBlue
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
//        label.font = label.font.withSize(25)
        return label
    }()
    
    let weatherInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
//        label.font = label.font.withSize(25)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        
    }
    
    private func setupSubviews() {
        layoutMainWeatherImage()
        layoutTimeLabel()
        layoutTemperatureLabel()
        layoutWeatherInfoLabel()
        layoutCell()
    }
    
    private func layoutCell() {
        NSLayoutConstraint.activate([
            self.contentView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func layoutMainWeatherImage() {
        contentView.addSubview(mainWeatherImage)
        mainWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        mainWeatherImage.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            mainWeatherImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainWeatherImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)  ,
            mainWeatherImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 45)

        ])
    }
    
    private func layoutTimeLabel() {
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor.constraint(equalTo: mainWeatherImage.rightAnchor, constant: 50),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10)
        ])
    }
    
    private func layoutWeatherInfoLabel() {
        contentView.addSubview(weatherInfoLabel)
        weatherInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherInfoLabel.leftAnchor.constraint(equalTo: timeLabel.leftAnchor),
            weatherInfoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10)
        ])
    }
    
    private func layoutTemperatureLabel() {
        contentView.addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperatureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
