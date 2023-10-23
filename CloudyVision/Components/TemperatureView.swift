//
//  TemperatureView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 23/10/2023.
//

import SwiftUI

struct TemperatureView: View {
    let temperature: Measurement<UnitTemperature>

    var body: some View {
        Text("\(Int(temperature.value))\(temperature.unit.symbol)")
    }
}

#Preview {
    TemperatureView(temperature: .init(value: 20.5, unit: .celsius))
}
