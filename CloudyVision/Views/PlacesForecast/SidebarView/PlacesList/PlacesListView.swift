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

    @Bindable var appModel: CloudyVisionModel

    private var allPlaces: [Place] {
        var list = Place.allPlaces
        if let currentPlace = locationManager.currentPlace {
            list.insert(currentPlace, at: 0)
        }
        return list
    }

    var body: some View {
        List(allPlaces, selection: $appModel.selectedPlace) { place in
            NavigationLink(value: place) {
                PlaceCell(place: place)
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
        guard appModel.selectedPlace == nil else { return }
        guard locationManager.status != .authorizedWhenInUse || locationManager.currentPlace != nil else { return }

        appModel.selectedPlace = allPlaces.first
    }
}

#Preview {
    PlacesListView(appModel: CloudyVisionModel())
}
