//
//  WeatherParameters.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct WeatherParameters: Codable {
    let temperature, feeling, minimum, maximum, pressure, humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feeling = "feels_like"
        case minimum = "temp_min"
        case maximum = "temp_max"
        case pressure, humidity
    }
    
    static let empty = WeatherParameters(
        temperature: 0,
        feeling: 0,
        minimum: 0,
        maximum: 0,
        pressure: 0,
        humidity: 0
    )
}
