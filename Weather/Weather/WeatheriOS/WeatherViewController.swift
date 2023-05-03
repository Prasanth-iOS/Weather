//
//  WeatherViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//
import MapKit

import UIKit

public final class WeatherViewController: UIViewController {

    public var searchVC: UISearchController?
    public var mapView = MKMapView(frame: CGRect.zero)
    public var viewModel: WeatherViewModel?

    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Weather"
        navigationItem.searchController = searchVC
        setupMapViewUI()
        viewModel?.onWeatherLoad = refreshUI
    }

    private func setupMapViewUI() {
        mapView.frame = view.frame
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.topAnchor.constraint(equalTo: mapView.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    public func refreshUI() {
        guard let lat = viewModel?.lat, let lon = viewModel?.lon else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.pinLocation(at: CLLocationCoordinate2DMake(lat, lon))
        }
    }

    private func pinLocation(at coordinate: CLLocationCoordinate2D) {
        mapView.removeAnnotations(mapView.annotations)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        mapView.setRegion(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 00.2)),
            animated: true)
    }
}

extension WeatherViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        // Check if there's a reusable annotation view first
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")
        if annotationView == nil {
            // Create a new one
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
            annotationView!.canShowCallout = true
            annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            // We got a resuable one
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}

public final class WeatherViewModel {
    private let weatherLoader: CurrentWeatherLoader
    private var weather: CurrentWeather?

    public init(weatherLoader: CurrentWeatherLoader) {
        self.weatherLoader = weatherLoader
    }

    public var onWeatherLoad: (() -> Void)?

    var lat: Double? {
        return weather?.coord?.lat
    }

    var lon: Double? {
        return weather?.coord?.lon
    }

    public func loadWeatherData(_ lat: Double, long: Double) {
        weatherLoader.load(String(lat), long: String(long)) { [weak self] result in
            if let weather = try? result.get() {
                self?.weather = weather
                self?.onWeatherLoad?()
            }
            // handle error scenario
        }
    }
}
