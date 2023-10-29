//
//  HumidityInfoCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 29/10/2023.
//

import CVCore
import SwiftUI

struct HumidityInfoCell: View {
    let humidity: Double

    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "drop.degreesign")
                .font(.largeTitle)
            Text(humidity, format: .percent)
                .font(.title)

            Spacer()

            Text("Humidity".uppercased())
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(UIConstants.blocksSpacing)
        .frame(maxWidth: .infinity, alignment: .leading)
        .aspectRatio(1, contentMode: .fill)
        .forecastItem()
    }
}

#Preview {
    HumidityInfoCell(humidity: 0.5)
}
