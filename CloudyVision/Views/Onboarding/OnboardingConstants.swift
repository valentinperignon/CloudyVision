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

    static let numberOfCloudsPerEdge = 20
    static let widthRange: ClosedRange<CGFloat> = 0.15...0.30
    static let xStartPoint: [Edge: CGFloat] = [.leading: -0.40, .trailing: 1.10]
    static let xAxis: [Edge: ClosedRange<CGFloat>] = [.leading:  -0.10...0.40, .trailing: 0.40...1.05]
    static let yAxis: ClosedRange<CGFloat> = -0.05...0.18
}
