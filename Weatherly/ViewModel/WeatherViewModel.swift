//
//  WeatherViewModel.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

class WeatherViewModel: ObservableObject {
    let api = OpenWeatherAPIClient(key: "API_KEY")
    
    var weather = Weather.empty {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        fetchWeather()
    }
    
    private func fetchWeather() {
        api.weather(for: 3060972) { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
}
