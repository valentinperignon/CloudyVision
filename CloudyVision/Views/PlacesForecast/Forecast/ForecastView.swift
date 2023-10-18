//
//  ForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

struct ForecastView: View {
    var selectedPlace: Place?

    var body: some View {
        VStack {
            Text(selectedPlace?.name ?? "No Name")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ForecastView()
}
