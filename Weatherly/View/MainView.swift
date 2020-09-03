//
//  MainView.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                WeatherView(weather: viewModel.weather)
                ForecastView()
                Spacer()
            }
        .navigationBarTitle("Bratislava")
        .navigationBarItems(
            leading: Button(action: {}) {
                Image(systemName: "location")
            },
            trailing: Button(action: {}) {
                Image(systemName: "magnifyingglass")
            }
        )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
