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
    
    private func buildUrl(api: RequestAPI, id: Int) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/\(api.rawValue)?id=\(id)&appid=\(key)&units=metric")!
    }
    
    private func fetchRequest<T: Codable>(_ api: RequestAPI, id: Int, completionHandler completion: @escaping (T?) -> Void) {
        let url = buildUrl(api: api, id: id)
        
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode), error == nil, data != nil else {
                    print("Failed to fetch weather!")
                    completion(nil)
                    return
                }
                
                do {
                    let weather = try self.decoder.decode(T.self, from: data!)
                    completion(weather)
                } catch {
                    print("Failed to decode weather!")
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
    
    func weather(for city: Int, completionHandler completion: @escaping (Weather?) -> Void) {
        fetchRequest(.weather, id: city, completionHandler: completion)
    }
}
