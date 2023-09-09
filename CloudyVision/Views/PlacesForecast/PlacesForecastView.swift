//
//  PlacesForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 09/09/2023.
//

import SwiftUI

struct PlacesForecastView: View {
    var body: some View {
        NavigationSplitView {
            FavoritePlacesView()
        } detail: {
            ForecastView()
        }
    }
}

#Preview {
    PlacesForecastView()
}
