//
//  TemperatureView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 23/10/2023.
//

import CoreVisionKit
import SwiftUI

struct TemperatureView: View {
    let temperature: Measurement<UnitTemperature>

    var body: some View {
        Text("\(Constants.formattedTemperature(temperature))")
    }
}

#Preview {
    TemperatureView(temperature: .init(value: 20.5, unit: .celsius))
}
