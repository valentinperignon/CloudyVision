//
//  ContentView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

struct ContentView: View {
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
    }
}

#Preview {
    ContentView()
}
