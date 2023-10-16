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

    @Query private var places: [Place]

    @Binding var currentPlace: Place?

    private var allPlaces: [Place] {
        var items = places
        if let currentLocation = locationManager.location {
            let currentLocation = Place(location: currentLocation, isCurrentLocation: true)
            items.insert(currentLocation, at: 0)
        }
        return items
    }

    var body: some View {
        List(allPlaces, selection: $currentPlace) { place in
            PlaceCell(place: place)
        }
    }
}

#Preview {
    PlacesListView(currentPlace: .constant(nil))
}
