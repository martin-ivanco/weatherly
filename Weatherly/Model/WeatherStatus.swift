//
//  WeatherStatus.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct WeatherStatus: Codable {
    let timestamp, sunrise, sunset: Int
    let temperature, feeling, pressure, humidity: Double
    let cloudiness, windSpeed, windAngle: Double
    let conditions: [WeatherCondition]
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "dt"
        case sunrise, sunset
        case temperature = "temp"
        case feeling = "feels_like"
        case pressure, humidity
        case cloudiness = "clouds"
        case windSpeed = "wind_speed"
        case windAngle = "wind_deg"
        case conditions = "weather"
    }
    
    static let empty = WeatherStatus(
        timestamp: 0,
        sunrise: 0,
        sunset: 0,
        temperature: 0,
        feeling: 0,
        pressure: 0,
        humidity: 0,
        cloudiness: 0,
        windSpeed: 0,
        windAngle: 0,
        conditions: []
    )
    
    var systemIconName: String {
        return Weather.systemIconName(id: conditions.first?.id)
    }
    
    var conditionsDescription: String {
        return conditions.first?.general ?? "Unknown"
    }

    var temperatureString: String {
        return "\(Int(round(temperature))) °C"
    }
}
