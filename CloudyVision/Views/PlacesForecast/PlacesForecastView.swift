//
//  PlacesForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CVCore
import SwiftUI

struct PlacesForecastView: View {
    @Environment(LocationManager.self) private var locationManager

    @State private var currentPlace: Place?

    var body: some View {
        NavigationSplitView {
            SidebarView(currentPlace: $currentPlace)
        } detail: {
            ForecastView()
        }
        .onAppear {
            if locationManager.status == .authorizedWhenInUse {
                locationManager.requestLocation()
            }
        }
    }
}

#Preview {
    PlacesForecastView()
}
