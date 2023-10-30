//
//  SidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CVCore
import SwiftUI

struct SidebarView: View {
    @Environment(ForecastModel.self) private var forecastModel

    @State private var placeSearcher = PlaceSearcher()

    var body: some View {
        Group {
            if placeSearcher.isSearching {
                PlacesSearchView(placeSearcher: placeSearcher, forecastModel: forecastModel)
            } else {
                PlacesListView(forecastModel: forecastModel)
            }
        }
        .navigationTitle("Weather")
        .searchable(text: $placeSearcher.query)
    }
}

#Preview {
    SidebarView()
}
