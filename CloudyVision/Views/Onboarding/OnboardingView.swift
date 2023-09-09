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
    @State private var isShowingLocationButton = false
    @State private var didAnsweredLocation = false

    private let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String

    var body: some View {
        VStack {
            Spacer()

            AnimatableTitle(title: appName, typingCount: typingCount)

            Text("Weather in a new dimension")
                .font(.title)
                .opacity(isShowingSubtitle ? 1 : 0)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .bottom) {
            VStack(spacing: 24) {
                Button(action: authorizeLocalization) {
                    Label("Authorize Localization", systemImage: "location")
                }
                .disabled(locationManager.status != .notDetermined)
                .opacity(isShowingLocationButton ? 1 : 0)

                Button(action: launchApp) {
                    Label("Launch App", systemImage: "arrow.right")
                }
                .padding(.bottom, 48)
                .opacity(locationManager.status != .notDetermined ? 1 : 0)
            }
        }
        .onAppear {
            withAnimation(.spring(duration: 4).delay(1)) {
                typingCount = appName.count
            }
            withAnimation(.default.delay(5)) {
                isShowingSubtitle = true
            }
            withAnimation(.default.delay(6)) {
                isShowingLocationButton = true
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
