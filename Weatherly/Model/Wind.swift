//
//  Wind.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct Wind: Codable {
    let speed, direction: Double
    
    enum CodingKeys: String, CodingKey {
        case speed
        case direction = "deg"
    }
    
    static let empty = Wind(speed: 0, direction: 0)
}
