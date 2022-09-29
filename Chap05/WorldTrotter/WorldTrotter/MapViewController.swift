//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by 김재형 on 2022/09/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
	
	var mapView: MKMapView!
	
	override func loadView() {
		mapView = MKMapView()							// Create a map view
		view = mapView									// Set it as *THE* view of this view controller
		
		let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
		segmentedControl.backgroundColor = UIColor.systemBackground
		segmentedControl.selectedSegmentIndex = 0
		
		segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
		
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(segmentedControl)
		
		// Constraints
//		let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
//		let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//		let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		
		let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
		let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
		let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
		
		
		topConstraint.isActive = true
		leadingConstraint.isActive = true
		trailingConstraint.isActive = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("MapViewController loaded it view.")
	}
	
	@objc func mapTypeChanged(_ segControl: UISegmentedControl) {
		switch segControl.selectedSegmentIndex {
		case 0:
			mapView.mapType = .standard
		case 1:
			mapView.mapType = .hybrid
		case 2:
			mapView.mapType = .satellite
		default:
			break
		}
	}
}
