//
//  OnboardingView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 09/09/2023.
//

import CoreVisionKit
import SwiftUI

struct OnboardingView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true

    @Environment(LocationManager.self) private var locationManager

    @State private var typingCount = 0
    @State private var didTouchLocalizationButton = false
    @State private var isShowingSubtitle = false
    @State private var isShowingButtons = false

    var body: some View {
        ZStack(alignment: .top) {
            WeatherBackgroundView()

            VStack {
                Spacer()

                AnimatableTitle(title: Constants.appName, typingCount: typingCount)

                Text("Weather in a new dimension")
                    .font(.title)
                    .opacity(isShowingSubtitle ? 1 : 0)

                Spacer()
            }
        }
        .overlay(alignment: .bottom) {
            VStack(spacing: 24) {
                LoadingButton(isLoading: didTouchLocalizationButton && locationManager.status == .notDetermined, action: authorizeLocalization) {
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
            withAnimation(.linear(duration: OnboardingConstants.typingDuration).delay(OnboardingConstants.typingDelay)) {
                typingCount = Constants.appName.count
            }
            withAnimation(.default.delay(OnboardingConstants.subtitleDelay)) {
                isShowingSubtitle = true
            }
            withAnimation(.default.delay(OnboardingConstants.buttonsDelay)) {
                isShowingButtons = true
            }
        }
    }

    private func authorizeLocalization() {
        withAnimation {
            didTouchLocalizationButton = true
        }
        locationManager.requestAuthorization()
    }

    private func launchApp() {
        isFirstLaunch = false
    }
}

#Preview {
    OnboardingView()
}
