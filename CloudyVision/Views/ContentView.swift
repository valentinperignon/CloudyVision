//
//  ContentView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CoreVisionKit
import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true

    @State private var locationManager = LocationManager()

    var body: some View {
        ZStack {
            if isFirstLaunch {
                OnboardingView()
            } else {
                PlacesForecastView()
            }
        }
        .environment(locationManager)
    }
}

#Preview {
    ContentView()
}
