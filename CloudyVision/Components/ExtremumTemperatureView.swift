//
//  ExtremumTemperatureView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 23/10/2023.
//

import SwiftUI

struct ExtremumTemperatureView: View {
    let lowTemperature: Measurement<UnitTemperature>
    let highTemperature: Measurement<UnitTemperature>

    var body: some View {
        HStack(spacing: 8) {
            HStack(spacing: 4) {
                Image(systemName: "arrow.up")
                TemperatureView(temperature: lowTemperature)
            }

            HStack(spacing: 4) {
                Image(systemName: "arrow.down")
                TemperatureView(temperature: highTemperature)
            }
        }
    }
}

#Preview {
    ExtremumTemperatureView(lowTemperature: PreviewHelper.lowTemperature, highTemperature: PreviewHelper.highTemperature)
}
