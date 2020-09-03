//
//  CitySearchView.swift
//  Weatherly
//
//  Created by Martin Ivančo on 03/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI
import Combine

struct CitySearchView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var searchValue = SearchValue()
    @Binding var isPresented: Bool
    @Binding var city: City
    
    var body: some View {
        VStack {
            TextField("Search for cities", text: self.$searchValue.current).padding()
            List(CityInfo.withName(searchValue.debounced, context: context), id: \.self) { info in
                Button(info.name) {
                    self.city = City(info: info)
                    self.isPresented = false
                }
            }.id(searchValue.id)
        }
    }
}

class SearchValue: ObservableObject {
    @Published var current: String = ""
    @Published var debounced: String = ""
    private var store = Set<AnyCancellable>()

    var id: UUID {
        UUID()
    }

    init() {
        $current
            .debounce(for: .seconds(0.8), scheduler: RunLoop.main)
            .sink { [weak self] (s) in
            self?.debounced = s
        }.store(in: &store)
    }
}
