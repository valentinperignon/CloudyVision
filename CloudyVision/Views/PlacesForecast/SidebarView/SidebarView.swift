//
//  SidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CVCore
import SwiftUI

struct SidebarView: View {
    @Environment(CloudyVisionModel.self) private var appModel

    @State private var placeSearcher = PlaceSearcher()

    var body: some View {
        Group {
            if placeSearcher.isSearching {
                PlacesSearchView(appModel: appModel, placeSearcher: placeSearcher)
            } else {
                PlacesListView(appModel: appModel)
            }
        }
        .navigationTitle("Weather")
        .searchable(text: $placeSearcher.query)
    }
}

#Preview {
    SidebarView()
}
