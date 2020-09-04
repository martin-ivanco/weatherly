//
//  WeatherViewModel.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    let api = OpenWeatherAPIClient(key: "API_KEY")
    var locationManager = CLLocationManager()
    
    var city = City.empty {
        willSet {
            objectWillChange.send()
        }
        didSet {
            fetchWeather()
        }
    }
    
    var weather = Weather.empty {
        willSet {
            objectWillChange.send()
        }
    }

    override
    init() {
        super.init()
        fetchWeather()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    private func fetchWeather() {
        api.weather(for: city) { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
}
