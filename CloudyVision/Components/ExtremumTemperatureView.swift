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
                Text("L")
                TemperatureView(temperature: lowTemperature)
            }

            HStack(spacing: 4) {
                Text("H")
                TemperatureView(temperature: highTemperature)
            }
        }
        .font(.caption)
        .foregroundStyle(.secondary)
    }
}

#Preview {
    ExtremumTemperatureView(lowTemperature: .init(value: 10, unit: .celsius), highTemperature: .init(value: 20, unit: .celsius))
}
