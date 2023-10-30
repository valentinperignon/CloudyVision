//
//  ChartView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import CVCore
import SwiftUI

struct ChartView: View {
    let chartType: ChartType

    var body: some View {
        switch chartType {
        case .feelsLike:
            FeelsLikeChartsView()
        }
    }
}

#Preview {
    ChartView(chartType: .feelsLike)
}
