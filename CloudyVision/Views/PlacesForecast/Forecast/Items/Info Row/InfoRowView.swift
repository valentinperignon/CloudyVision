//
//  InfoRowView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 27/10/2023.
//

import CVCore
import SwiftUI
import WeatherKit

struct InfoRowView: View {
    let feelsLike: Measurement<UnitTemperature>
    let amount: Measurement<UnitLength>
    let uvIndex: UVIndex
    let humidity: Double
    let visibility: Measurement<UnitLength>

    var body: some View {
        HStack(spacing: UIConstants.blocksSpacing) {
            InfoRowCell(systemIcon: "thermometer.medium", title: "Feels Like", value: Constants.formattedTemperature(feelsLike))
            InfoRowCell(systemIcon: "umbrella", title: "Precipitation", value: Constants.formattedLength(amount))
            InfoRowCell(systemIcon: "sunglasses", title: "UV Index", value: "\(uvIndex.value)", hint: uvIndex.category.description)
            InfoRowCell(systemIcon: "drop.degreesign", title: "Humidity", value: humidity.formatted(.percent))
            InfoRowCell(systemIcon: "eyes.inverse", title: "Visibility", value: Constants.formattedLength(visibility))
        }
        .padding(.horizontal, UIConstants.blocksSpacing)
    }
}
