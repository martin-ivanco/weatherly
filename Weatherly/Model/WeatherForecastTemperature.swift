//
//  WeatherForecastTemperature.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct WeatherForecastTemperature: Codable {
    let minimum, maximum, morning, day, evening, night: Double
    
    enum CodingKeys: String, CodingKey {
        case minimum = "min"
        case maximum = "max"
        case morning = "morn"
        case day = "day"
        case evening = "eve"
        case night = "night"
    }
    
    static let empty = WeatherForecastTemperature(
        minimum: 0,
        maximum: 0,
        morning: 0,
        day: 0,
        evening: 0,
        night: 0
    )
}
