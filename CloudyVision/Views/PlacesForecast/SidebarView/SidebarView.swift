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

    @Binding var currentPlace: Place?

    var body: some View {
        Group {
            if placeSearcher.hasNoResult {
                PlacesListView(currentPlace: $currentPlace)
            } else {
                PlacesSearchView(placeSearcher: placeSearcher)
            }
        }
        .navigationTitle("Weather")
        .searchable(text: $placeSearcher.completer.queryFragment)
    }
}

#Preview {
    SidebarView(currentPlace: .constant(nil))
}
