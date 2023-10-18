//
//  SidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CVCore
import SwiftUI

struct SidebarView: View {
    @State private var placeSearcher = PlaceSearcher()

    @Binding var selectedPlace: Place?

    var body: some View {
        Group {
            if placeSearcher.isSearching {
                PlacesSearchView(placeSearcher: placeSearcher, selectedPlace: $selectedPlace)
            } else {
                PlacesListView(selectedPlace: $selectedPlace)
            }
        }
        .navigationTitle("Weather")
        .searchable(text: $placeSearcher.query)
    }
}

#Preview {
    SidebarView(selectedPlace: .constant(nil))
}
