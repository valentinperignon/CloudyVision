//
//  InfoRowView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 27/10/2023.
//

import CoreVisionKit
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
            InfoRowCell(chartType: .feelsLike, systemIcon: "thermometer.medium",
                        title: "Feels Like",
                        value: Constants.formattedTemperature(feelsLike))
            InfoRowCell(chartType: .precipitations, systemIcon: "umbrella",
                        title: "Precipitation",
                        value: Constants.formattedLength(amount))
            InfoRowCell(chartType: .uvIndex, systemIcon: "sunglasses",
                        title: "UV Index",
                        value: "\(uvIndex.value)", hint: uvIndex.category.description)
            InfoRowCell(chartType: .humidity, systemIcon: "drop.degreesign",
                        title: "Humidity",
                        value: humidity.formatted(.percent))
            InfoRowCell(chartType: .visibility, systemIcon: "eyes.inverse",
                        title: "Visibility",
                        value: Constants.formattedLength(visibility))
        }
        .padding(.horizontal, UIConstants.blocksSpacing)
    }
}
