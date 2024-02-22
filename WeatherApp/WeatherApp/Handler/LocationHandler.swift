//
//  LocationHandler.swift
//  WeatherApp
//
//  Created by Jabir on 21/02/2024.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let handler = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        handler.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        handler.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
}
