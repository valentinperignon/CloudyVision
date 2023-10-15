//
//  PlacesSidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 10/10/2023.
//

import CVCore
import SwiftData
import SwiftUI

struct PlacesListView: View {
    @Environment(LocationManager.self) private var locationManager

    @State private var search = ""

    @Query private var places: [Place]

    private var filteredPlaces: [Place] {
        guard search.isEmpty else {
            // TODO: Operate search here
            return []
        }

        var allPlaces = places
        if let currentPlace = locationManager.location {
            allPlaces.insert(Place(location: currentPlace, isCurrentLocation: true), at: 0)
        }
        return allPlaces
    }

    var body: some View {
        List(filteredPlaces) { place in
            Text(place.name)
        }
        .navigationTitle("Weather")
        .searchable(text: $search)
        .overlay {
            if !search.isEmpty && filteredPlaces.isEmpty {
                ContentUnavailableView.search
            }
        }
    }
}

#Preview {
    PlacesListView()
}
