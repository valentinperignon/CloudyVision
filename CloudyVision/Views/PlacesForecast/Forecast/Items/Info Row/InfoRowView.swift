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
            FeelsLikeInfoCell(feelsLike: feelsLike)

            PrecipitationInfoCell(amount: amount)

            UVInfoCell(uvIndex: uvIndex)

            HumidityInfoCell(humidity: humidity)

            VisibilityInfoCell(visibility: visibility)
        }
        .padding(.horizontal, UIConstants.blocksSpacing)
    }
}
