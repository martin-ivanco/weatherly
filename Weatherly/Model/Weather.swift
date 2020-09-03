//
//  Weather.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let coordinates: Coordinates
    let conditions: [WeatherCondition]
    let parameters: WeatherParameters
    let wind: Wind
    let cloudiness: Cloudiness
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case conditions = "weather"
        case parameters = "main"
        case wind
        case cloudiness = "clouds"
    }
    
    static let empty = Weather(
        coordinates: Coordinates.empty,
        conditions: [],
        parameters: WeatherParameters.empty,
        wind: Wind.empty,
        cloudiness: Cloudiness.empty
    )
    
    var systemIconName: String {
        return "cloud"
    }
    
    var conditionsDescription: String {
        return conditions.first?.general ?? "Unknown"
    }
    
    var temperature: String {
        return "\(Int(round(parameters.temperature))) °C"
    }
}
