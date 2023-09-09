//
//  ContentView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("didLaunchedAppBefore") private var didLauchedAppBefore = false

    var body: some View {
        if didLauchedAppBefore {
            NavigationSplitView {
                FavoritePlacesView()
            } detail: {
                ForecastView()
            }
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
