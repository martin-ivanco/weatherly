//
//  Cloudiness.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

struct Cloudiness: Codable {
    let percentage: Double
    
    enum CodingKeys: String, CodingKey {
        case percentage = "all"
    }
    
    static let empty = Cloudiness(percentage: 0)
}
