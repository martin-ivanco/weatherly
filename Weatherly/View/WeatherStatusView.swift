//
//  WeatherStatusView.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI

struct WeatherStatusView: View {
    let status: WeatherStatus
    
    var body: some View {
        GeometryReader(content: {geometry in
            VStack {
                Image(systemName: self.status.systemIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 0.5 * geometry.size.width,
                        height: 0.5 * geometry.size.width
                    )
                Text(self.status.conditionsDescription)
                    .font(.subheadline)
                Text(self.status.temperatureString)
                    .font(.largeTitle)
            }
            .frame(height: geometry.size.height)
        })
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherStatusView(status: WeatherStatus.empty)
    }
}
