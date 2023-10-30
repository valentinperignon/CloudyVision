//
//  LoadingWeatherView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import SwiftUI

struct LoadingWeatherView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())

            Text("Loading")
                .font(.title)
            Text("We analyze the weather for the next few days…")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    LoadingWeatherView()
}
