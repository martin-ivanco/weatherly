//
//  WeatherForecast.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct WeatherForecast: Codable {
    let timestamp, sunrise, sunset: Int
    let temperature: WeatherForecastTemperature
    let pressure, humidity, cloudiness, windSpeed, windAngle: Double
    let conditions: [WeatherCondition]
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "dt"
        case sunrise, sunset
        case temperature = "temp"
        case pressure, humidity
        case cloudiness = "clouds"
        case windSpeed = "wind_speed"
        case windAngle = "wind_deg"
        case conditions = "weather"
    }
    
    static let empty = WeatherForecast(
        timestamp: 0,
        sunrise: 0,
        sunset: 0,
        temperature: WeatherForecastTemperature.empty,
        pressure: 0,
        humidity: 0,
        cloudiness: 0,
        windSpeed: 0,
        windAngle: 0,
        conditions: []
    )
    
    var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }

    static let dateFormatter = DateFormatter()

    var weekDay: String {
        return WeatherForecast.dateFormatter.shortWeekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
    }
    
    var systemIconName: String {
        return Weather.systemIconName(id: conditions.first?.id)
    }
    
    var maxTemp: String {
        return "\(Int(round(temperature.maximum)))"
    }
    
    var minTemp: String {
        return "\(Int(round(temperature.minimum)))"
    }
}
