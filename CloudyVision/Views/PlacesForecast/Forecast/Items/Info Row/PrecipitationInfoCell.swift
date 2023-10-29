//
//  PrecipitationInfoCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 29/10/2023.
//

import CVCore
import SwiftUI

struct PrecipitationInfoCell: View {
    let amount: Measurement<UnitLength>

    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "umbrella")
                .font(.largeTitle)
            Text(Constants.formattedLength(amount))
                .font(.title)

            Spacer()

            Text("Precipitation".uppercased())
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
    PrecipitationInfoCell(amount: .init(value: 10, unit: .millimeters))
}
