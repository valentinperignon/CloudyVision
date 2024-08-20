//
//  ChartTitleView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 31/10/2023.
//

import CoreVisionKit
import SwiftUI

struct ChartTitleView: View {
    let title: LocalizedStringKey

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 64)
        .glassBackgroundEffect(in: Capsule())
    }
}

#Preview {
    ChartTitleView(title: ChartType.feelsLike.title)
}
