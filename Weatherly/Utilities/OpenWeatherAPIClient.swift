//
//  OpenWeatherAPIClient.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import Foundation

class OpenWeatherAPIClient {
    private let key: String
    private let decoder = JSONDecoder()
    private let session = URLSession(configuration: .default)
    
    private enum RequestAPI: String {
        case weather, forecast
    }
    
    init(key: String) {
        self.key = key
    }
    
    private func buildUrl(coordinates: Coordinates) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&exclude=minutely,hourly&appid=\(key)&units=metric")!
    }
    
    func weather(for city: City, completionHandler completion: @escaping (Weather?) -> Void) {
        if city.coordinates == nil {
            completion(nil)
            return
        }
        let url = buildUrl(coordinates: city.coordinates!)
        
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil, data != nil else {
                    print("Failed to fetch weather!")
                    completion(nil)
                    return
                }
                
                do {
                    let weather = try self.decoder.decode(Weather.self, from: data!)
                    completion(weather)
                } catch {
                    print("Failed to decode weather!")
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
    
}
