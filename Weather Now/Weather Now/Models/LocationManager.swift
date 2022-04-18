//
//  LocationManager.swift
//  Weather Now
//
//  Created by Бернат Данила on 11.04.2022.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
    
    
}

//lazy var locationManager: CLLocationManager = {
//    let lm = CLLocationManager()
//    lm.delegate = self
//    lm.desiredAccuracy = kCLLocationAccuracyKilometer
//    lm.requestWhenInUseAuthorization()
//    return lm
//}()
//
