//
//  ContentView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            FavoritePlacesView()
        } detail: {
            ForecastView()
        }
    }
}

#Preview {
    ContentView()
}
