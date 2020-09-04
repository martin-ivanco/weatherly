//
//  WeatherForecastView.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI

struct WeatherForecastView: View {
    let forecasts: [WeatherForecast]
    static let emptyForecasts = [WeatherForecast.empty, WeatherForecast.empty, WeatherForecast.empty]
    
    init(forecasts: [WeatherForecast]) {
        self.forecasts = forecasts.count > 2 ? forecasts : WeatherForecastView.emptyForecasts
    }
    
    var body: some View {
        HStack {
            ForecastCell(forecast: self.forecasts[0])
                .padding()
            ForecastCell(forecast: self.forecasts[1])
                .padding()
            ForecastCell(forecast: self.forecasts[2])
                .padding()
        }
    }
}

struct ForecastCell: View {
    let forecast: WeatherForecast
    
    var body: some View {
        GeometryReader(content: {geometry in
            VStack {
                Text(self.forecast.weekDay.uppercased())
                    .font(.caption)
                Image(systemName: self.forecast.systemIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 0.6 * geometry.size.width,
                        height: 0.6 * geometry.size.width
                    )
                Text(self.forecast.maxTemp)
                Text(self.forecast.minTemp)
            }
        })
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView(forecasts: WeatherForecastView.emptyForecasts)
    }
}
