//
//  OnboardingConstants.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 16/09/2023.
//

import Foundation
import SwiftUI

enum OnboardingConstants {
    // MARK: - Animations

    static let typingDelay: TimeInterval = 1
    static let typingDuration: TimeInterval = 4
    static let subtitleDelay: TimeInterval = 5
    static let buttonsDelay: TimeInterval = 6

    static let cloudsInterval = buttonsDelay

    // MARK: - Canvas

    // Sun

    static let sunSize = CGSize(width: 176, height: 176)
    static let sunX = 0.7
    static let sunY = -(sunSize.height / 2) - 10
    static let sunRadius = sunSize.width / 2

    // Clouds

    static let numberOfCloudsPerEdge = Int.random(in: 18...22)

    static let cloudsWidthRange: ClosedRange<CGFloat> = 0.15...0.30
    static let cloudsXStartPoint: [Edge: CGFloat] = [.leading: -0.40, .trailing: 1.10]
    static let cloudsXAxis: [Edge: ClosedRange<CGFloat>] = [.leading:  -0.10...0.40, .trailing: 0.40...1.05]
    static let cloudsYAxis: ClosedRange<CGFloat> = -0.05...0.18
}
