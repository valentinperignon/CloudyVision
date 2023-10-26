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
        HStack(spacing: 0) {
            HStack(spacing: 4) {
                Image(systemName: symbolName)
                Text(label.uppercased())
            }
            .foregroundStyle(.secondary)

            Spacer()

            Text(value)
        }
    }
}

#Preview {
    DayInfoCell(symbolName: "thermometer.medium", label: "Temp.", value: "18.5°C")
}
