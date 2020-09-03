//
//  City.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation
import CoreData

struct City: Codable {
    let info: CityInfo?
    
    enum CodingKeys: String, CodingKey {
        case id, name, state, country
        case coordinates = "coord"
    }
    
    static let empty = City(info: nil)

    init(info: CityInfo?) {
        self.info = info
    }

    init(from decoder: Decoder) throws {
        let context = decoder.managedObjectContext!
        info = CityInfo(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        info!.id = try container.decode(Int.self, forKey: .id)
        info!.name = try container.decode(String.self, forKey: .name)
        info!.state = try container.decode(String.self, forKey: .state)
        info!.country = try container.decode(String.self, forKey: .country)
        let coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        info!.longitude = coordinates.longitude
        info!.latitude = coordinates.latitude
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info!.id, forKey: .id)
        try container.encode(info!.name, forKey: .name)
        try container.encode(info!.state, forKey: .state)
        try container.encode(info!.country, forKey: .country)
        try container.encode(info!.coordinates, forKey: .coordinates)
    }
    
    var id: Int {
        get { info?.id ?? 0 }
        set { info?.id = newValue }
    }
    
    var name: String {
        get { info?.name ?? "Unknown" }
        set { info?.name = newValue }
    }
    
    var state: String {
        get { info?.state ?? "" }
        set { info?.state = newValue }
    }
    
    var country: String {
        get { info?.country ?? "" }
        set { info?.country = newValue }
    }
    
    var coordinates: Coordinates? {
        get { info?.coordinates }
        set { info?.coordinates = newValue ?? Coordinates.empty }
    }
}
