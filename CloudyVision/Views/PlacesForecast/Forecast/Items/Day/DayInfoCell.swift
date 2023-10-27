//
//  DayInfoCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 26/10/2023.
//

import SwiftUI

struct DayInfoCell: View {
    let symbolName: String
    let label: String
    let value: String

    var body: some View {
        VStack {
            Image(systemName: symbolName)
                .font(.title2)
                .symbolRenderingMode(.multicolor)
            Text(value)
                .padding(.bottom, 4)

            Text(label.uppercased())
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DayInfoCell(symbolName: "thermometer.medium", label: "Temp.", value: "18.5°C")
}
