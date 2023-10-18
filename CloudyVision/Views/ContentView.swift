//
//  ContentView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase

    @AppStorage("didLaunchedAppBefore") private var didLauchedAppBefore = false

    @State private var locationManager = LocationManager()

    var body: some View {
        Group {
            if didLauchedAppBefore {
                PlacesForecastView()
            } else {
                OnboardingView()
            }
        }
        .environment(locationManager)
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                locationManager.requestLocationIfPossible()
            }
        }
    }
}

#Preview {
    ContentView()
}
