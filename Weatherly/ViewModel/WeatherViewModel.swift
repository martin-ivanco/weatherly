//
//  WeatherViewModel.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation
import CoreData

class WeatherViewModel: ObservableObject {
    let api = OpenWeatherAPIClient(key: "f2aad3105ea044b20fb32f04affee342")
    
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

    init() {
        fetchWeather()
    }
    
    private func fetchWeather() {
        api.weather(for: city) { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
}
