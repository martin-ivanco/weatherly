//
//  Weather.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let latitude, longitude: Double
    let status: WeatherStatus
    let forecasts: [WeatherForecast]
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case status = "current"
        case forecasts = "daily"
    }
    
    static let empty = Weather(
        latitude: 0,
        longitude: 0,
        status: WeatherStatus.empty,
        forecasts: []
    )
    
    static func systemIconName(id: Int?) -> String {
        if let id = id {
            if id >= 200 && id < 300 {
                return "cloud.bolt.rain"
            }
            if id >= 300 && id < 400 {
                return "cloud.drizzle"
            }
            if id >= 500 && id < 600 {
                return "cloud.rain"
            }
            if id >= 600 && id < 700 {
                return "cloud.snow"
            }
            if id >= 700 && id < 800 {
                return "cloud.fog"
            }
            if id == 800 {
                return "sun.max"
            }
            if id == 801 {
                return "sun.min"
            }
            if id == 802 {
                return "cloud.sun"
            }
            if id == 803 || id == 804 {
                return "cloud"
            }
        }
        return "questionmark.circle.fill"
    }
}
