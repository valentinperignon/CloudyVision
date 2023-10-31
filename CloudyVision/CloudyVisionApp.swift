//
//  CloudyVisionApp.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

@main
struct CloudyVisionApp: App {
    @State private var appModel = CloudyVisionModel()

    var body: some Scene {
        WindowGroup(Text(verbatim: Constants.appName)) {
            ContentView()
                .environment(appModel)
        }

        WindowGroup(id: Constants.windowCharts, for: ChartType.self) { chartType in
            ChartView(chartType: chartType.wrappedValue ?? .feelsLike)
                .environment(appModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 0.6, depth: 0.1, in: .meters)
    }
}
