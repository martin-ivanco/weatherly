//
//  Coordinates.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct Coordinates: Codable {
    let longitude, latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
    
    static let empty = Coordinates(longitude: 0, latitude: 0)
}
