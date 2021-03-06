//
//  Extensions.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

extension Decoder {
    var managedObjectContext: NSManagedObjectContext? {
        self.userInfo[CodingUserInfoKey.managedObjectContext!] as? NSManagedObjectContext
    }
}

extension CityInfo {
    static func withId(_ id: Int, context: NSManagedObjectContext) -> CityInfo {
        // look up id in Core Data
        let request = fetchRequest(NSPredicate(format: "id_ = %@", "\(id)"))
        let cities = (try? context.fetch(request)) ?? []
        if let city = cities.first {
            // if found, return corresponding city
            return city
        } else {
            // if not, create one
            let city = CityInfo(context: context)
            city.id = id
            return city
        }
    }
    
    static func withName(_ name: String, context: NSManagedObjectContext) -> [CityInfo] {
        // if name is empty, return history
        if name == "" {
            return searchHistory(context: context)
        }
        // look up name in Core Data
        let request = fetchRequest(NSPredicate(format: "name_ CONTAINS[cd] %@", name))
        return (try? context.fetch(request)) ?? []
    }
    
    static func withCoords(_ coords: Coordinates, context: NSManagedObjectContext) -> CityInfo {
        // create an imaginary city with id = 0
        let city = CityInfo(context: context)
        city.id = 0
        city.name = "Weather"
        city.coordinates = coords
        return city
    }
    
    static func searchHistory(context: NSManagedObjectContext) -> [CityInfo] {
        let userDefaults = UserDefaults.standard
        var cities: [CityInfo] = []
        if let ids = userDefaults.array(forKey: "search.history.ids") {
            for item in ids {
                if let id = item as? Int {
                    cities.append(withId(id , context: context))
                }
            }
        }
        return cities
    }
    
    private static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<CityInfo> {
        let request = NSFetchRequest<CityInfo>(entityName: "CityInfo")
        request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    var id: Int {
        get { Int(id_) }
        set { id_ = Int64(newValue) }
    }
    
    var name: String {
        get { name_ ?? "Unknown" }
        set { name_ = newValue }
    }
    
    var state: String {
        get { state_ ?? "" }
        set { state_ = newValue }
    }
    
    var country: String {
        get { country_ ?? "" }
        set { country_ = newValue }
    }
    
    var coordinates: Coordinates {
        get { Coordinates(longitude: longitude, latitude: latitude) }
        set { longitude = newValue.longitude; latitude = newValue.latitude }
    }
}
