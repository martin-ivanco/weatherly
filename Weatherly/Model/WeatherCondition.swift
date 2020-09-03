//
//  WeatherCondition.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct WeatherCondition: Codable {
    let id: Int
    let general, specific: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case general = "main"
        case specific = "description"
    }
    
    static let empty = WeatherCondition(id: 0, general: "", specific: "")
}
