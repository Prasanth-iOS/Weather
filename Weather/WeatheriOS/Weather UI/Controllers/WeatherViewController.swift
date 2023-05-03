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
        
        guard let annotation = viewModel?.annotation else {
            return
        }
        mapView.addAnnotation(annotation)
        mapView.setRegion(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 00.2)),
            animated: true)
    }
}

extension WeatherViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        if let annotation = annotation as? Annotation {
          annotationView?.canShowCallout = true
          annotationView?.detailCalloutAccessoryView = Callout(annotation: annotation)
        }
        return annotationView
    }
}
