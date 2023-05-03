//
//  Callout.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import MapKit
import UIKit

class Annotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let temperature: String
    let condition: String
    let windSpeed: String
    let humidity: String
    
    init(weather: CurrentWeather) {
        coordinate = CLLocationCoordinate2DMake(weather.coord?.lat ?? 0, weather.coord?.lon ?? 0)
        temperature = "\(weather.main?.temp ?? 0)"
        condition = "\(weather.weather?.first?.description ?? "")"
        windSpeed = "\(weather.wind?.speed ?? 0)"
        humidity = "\(weather.main?.humidity ?? 0)"
    }
}


class Callout: UIView {
    private let temperatureLabel = UILabel(frame: .zero)
    private let conditionLabel = UILabel(frame: .zero)
    private let windLabel = UILabel(frame: .zero)
    private let humidityLabel = UILabel(frame: .zero)
    private let imageView = UIImageView(frame: .zero)
    private let annotation: Annotation
    
    init(annotation: Annotation) {
        self.annotation = annotation
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        setupTemperature()
        setupCondition()
        setupWindSpeed()
        setupHumidity()
    }
    
    private func setupTemperature() {
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 20)
        temperatureLabel.text = "Temperature: \(annotation.temperature)"
        addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupCondition() {
        conditionLabel.font = UIFont.systemFont(ofSize: 14)
        conditionLabel.textColor = .gray
        conditionLabel.text = "Condition: \(annotation.condition.uppercased())"
        addSubview(conditionLabel)
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8).isActive = true
        conditionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        conditionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupWindSpeed() {
        windLabel.font = UIFont.systemFont(ofSize: 14)
        windLabel.textColor = .gray
        windLabel.text = "Wind Speed: \(annotation.windSpeed)"
        addSubview(windLabel)
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 8).isActive = true
        windLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        windLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    private func setupHumidity() {
        humidityLabel.font = UIFont.systemFont(ofSize: 14)
        humidityLabel.textColor = .gray
        humidityLabel.text = "Humidity: \(annotation.humidity)"
        addSubview(humidityLabel)
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 8).isActive = true
        humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        humidityLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        humidityLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
