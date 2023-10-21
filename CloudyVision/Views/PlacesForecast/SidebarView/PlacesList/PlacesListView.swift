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

    private var allPlaces: [Place] {
        var list = places
        if let currentPlace = locationManager.currentPlace {
            list.insert(currentPlace, at: 0)
        }
        return list
    }

    var body: some View {
        List(allPlaces, selection: $selectedPlace) { place in
            Button {
                selectedPlace = place
            } label: {
                PlaceCell(place: place)
            }
        }
        .onAppear {
            selectFirstItem()
        }
        .onChange(of: allPlaces) {
            selectFirstItem()
        }
    }

    private func selectFirstItem() {
        guard selectedPlace == nil else { return }
        selectedPlace = allPlaces.first
    }
}

#Preview {
    PlacesListView(selectedPlace: .constant(nil))
}
