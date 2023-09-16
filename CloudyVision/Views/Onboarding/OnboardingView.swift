//
//  OnboardingView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CVCore
import SwiftUI

struct OnboardingView: View {
    @AppStorage("didLaunchedAppBefore") private var didLauchedAppBefore = false

    @Environment(LocationManager.self) private var locationManager

    @State private var typingCount = 0
    @State private var isShowingSubtitle = false
    @State private var isShowingButtons = false

    private let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String

    enum AnimationConsants {
        static let typingDelay: TimeInterval = 1
        static let typingDuration: TimeInterval = 4
        static let subtitleDelay: TimeInterval = 5
        static let buttonsDelay: TimeInterval = 6

        static let cloudsInterval = buttonsDelay
    }

    var body: some View {
        ZStack(alignment: .top) {
            WeatherBackgroundView()

            VStack {
                Spacer()

                AnimatableTitle(title: appName, typingCount: typingCount)

                Text("Weather in a new dimension")
                    .font(.title)
                    .opacity(isShowingSubtitle ? 1 : 0)

                Spacer()
            }
        }
        .overlay(alignment: .bottom) {
            VStack(spacing: 24) {
                Button(action: authorizeLocalization) {
                    Label("Authorize Localization", systemImage: "location")
                }
                .disabled(locationManager.status != .notDetermined)

                Button(action: launchApp) {
                    Label("Launch App", systemImage: "arrow.right")
                }
                .padding(.bottom, 48)
                .opacity(locationManager.status != .notDetermined ? 1 : 0)
            }
            .opacity(isShowingButtons ? 1 : 0)
        }
        .onAppear {
            withAnimation(.spring(duration: AnimationConsants.typingDuration).delay(AnimationConsants.typingDelay)) {
                typingCount = appName.count
            }
            withAnimation(.default.delay(AnimationConsants.subtitleDelay)) {
                isShowingSubtitle = true
            }
            withAnimation(.default.delay(AnimationConsants.buttonsDelay)) {
                isShowingButtons = true
            }
        }
    }

    private func authorizeLocalization() {
        locationManager.requestAuthorization()
    }

    private func launchApp() {
        didLauchedAppBefore = true
    }
}

#Preview {
    OnboardingView()
}
