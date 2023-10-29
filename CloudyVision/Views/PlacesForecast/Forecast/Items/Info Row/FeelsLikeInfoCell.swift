//
//  FeelsLikeInfoCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 29/10/2023.
//

import CVCore
import SwiftUI

struct FeelsLikeInfoCell: View {
    let feelsLike: Measurement<UnitTemperature>

    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "thermometer.medium")
                .font(.largeTitle)
            Text(Constants.formattedTemperature(feelsLike))
                .font(.title)

            Spacer()

            Text("Feels Like".uppercased())
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
    FeelsLikeInfoCell(feelsLike: PreviewHelper.temperature)
}
