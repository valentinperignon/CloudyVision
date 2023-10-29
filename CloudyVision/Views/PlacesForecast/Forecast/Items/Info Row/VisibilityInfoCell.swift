//
//  VisibilityInfoCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 27/10/2023.
//

import CVCore
import SwiftUI

struct VisibilityInfoCell: View {
    let visibility: Measurement<UnitLength>

    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "eyes.inverse")
                .font(.largeTitle)
            Text(Constants.formattedLength(visibility))
                .font(.title)

            Spacer()

            Text("Visibility".uppercased())
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
    VisibilityInfoCell(visibility: .init(value: 10, unit: .kilometers))
}
