//
//  CloudyVisionApp.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CoreVisionKit
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
        .chartPlacement()
    }
}

extension Scene {
    func chartPlacement() -> some Scene {
        if #available(visionOS 2.0, *) {
            return self.defaultWindowPlacement { _, context in
                    if context.windows.count == 1, let mainWindow = context.windows.first {
                        return WindowPlacement(.trailing(mainWindow))
                    } else if let lastWindow = context.windows.last {
                        return WindowPlacement(.above(lastWindow))
                    } else {
                        return WindowPlacement()
                    }
            }
            .defaultSize(width: 600, height: 300)
        } else {
            return self
        }
    }
}
