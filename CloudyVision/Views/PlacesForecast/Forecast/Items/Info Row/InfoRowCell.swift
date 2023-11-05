//
//  InfoRowCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import CoreVisionKit
import SwiftUI

struct InfoRowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(UIConstants.blocksSpacing)
            .frame(maxWidth: .infinity, alignment: .leading)
            .aspectRatio(1, contentMode: .fill)
            .forecastItem()
            .hoverEffect()
    }
}

struct InfoRowCell: View {
    @Environment(\.openWindow) private var openWindow

    let chartType: ChartType
    let systemIcon: String
    let title: String
    let value: String
    var hint: String?

    var body: some View {
        Button {
            openWindow(id: Constants.windowCharts, value: chartType)
        } label: {
            VStack(alignment: .leading) {
                Image(systemName: systemIcon)
                    .font(.largeTitle)

                Text(value)
                    .font(.title)
                if let hint {
                    Text(hint)
                        .font(.subheadline)
                }

                Spacer()

                Text(title.uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .buttonStyle(InfoRowButtonStyle())
    }
}

#Preview {
    InfoRowCell(chartType: .feelsLike, systemIcon: "thermometer.medium", title: "Feels Like", value: "10°C")
}
