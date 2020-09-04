//
//  MainView.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var viewModel = WeatherViewModel()
    @State var showCitySearch = false
    
    var body: some View {
        NavigationView {
            AdaptiveStack {
                WeatherStatusView(status: self.viewModel.weather.status)
                WeatherForecastView(forecasts: self.viewModel.weather.forecasts.count > 2 ? Array(self.viewModel.weather.forecasts[1...]) : [])
            }
            .navigationBarTitle(viewModel.city.name)
            .navigationBarItems(
                leading: Button(action: {}) {
                    Image(systemName: "location")
                },
                trailing: Button(action: { self.showCitySearch.toggle() }) {
                    Image(systemName: "magnifyingglass")
                }
            )
            .sheet(isPresented: self.$showCitySearch) {
                CitySearchView(isPresented: self.$showCitySearch, city: self.$viewModel.city)
                .environment(\.managedObjectContext, self.context)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
