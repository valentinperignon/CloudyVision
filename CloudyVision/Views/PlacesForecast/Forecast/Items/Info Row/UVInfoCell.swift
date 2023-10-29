//
//  UVInfoCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 29/10/2023.
//

import CVCore
import SwiftUI
import WeatherKit

struct UVInfoCell: View {
    let uvIndex: UVIndex

    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "sunglasses")
                .font(.largeTitle)
            Text("\(uvIndex.value)")
                .font(.title)
            Text(uvIndex.category.description)
                .font(.subheadline)

            Spacer()

            Text("UV Index".uppercased())
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(UIConstants.blocksSpacing)
        .frame(maxWidth: .infinity, alignment: .leading)
        .aspectRatio(1, contentMode: .fill)
        .forecastItem()
    }
}
