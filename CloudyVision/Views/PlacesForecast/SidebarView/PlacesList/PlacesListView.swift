//
//  PlacesSidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 10/10/2023.
//

import CVCore
import SwiftUI

struct PlacesListView: View {
    @Environment(LocationManager.self) private var locationManager

    @Binding var selectedPlace: Place?

    private var allPlaces: [Place] {
        var list = Place.allPlaces
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
            .onChange(of: place) {
                print("PLACE \(place.name) HAS CHANGED")
            }
        }
        .onAppear {
            selectDefaultPlace()
        }
        .onChange(of: allPlaces) {
            selectDefaultPlace()
        }
    }

    private func selectDefaultPlace() {
        guard selectedPlace == nil else { return }
        guard locationManager.status != .authorizedWhenInUse || locationManager.currentPlace != nil else { return }

        selectedPlace = allPlaces.first
    }
}

#Preview {
    PlacesListView(selectedPlace: .constant(nil))
}
