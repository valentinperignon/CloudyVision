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

    @Binding var selectedPlace: Place?

    var body: some View {
        List(selection: $selectedPlace) {
            if let currentPlace = locationManager.currentPlace {
                PlaceCell(place: currentPlace)
            }

            ForEach(places) { place in
                PlaceCell(place: place)
            }
        }
    }
}

#Preview {
    PlacesListView(selectedPlace: .constant(nil))
}
