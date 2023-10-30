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
        WindowGroup("Cloudy Vision") {
            ContentView()
                .environment(appModel)
        }

        WindowGroup(id: "Charts") {

        }
    }
}
