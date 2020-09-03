//
//  WeatherView.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    let weather: Weather
    
    var body: some View {
        GeometryReader(content: {geometry in
            VStack {
                Image(systemName: self.weather.systemIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 0.6 * geometry.size.width)
                Text(self.weather.conditionsDescription)
                    .font(.subheadline)
                Text(self.weather.temperature)
                    .font(.largeTitle)
            }
        })
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: Weather.empty)
    }
}
