//
//  WeatherBackgroundView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 10/09/2023.
//

import SwiftUI

final class Cloud {
    let resource: ImageResource
    let start: CGPoint
    let size: CGSize
    let vector: CGVector

    var position: CGPoint

    init(resource: ImageResource, start: CGPoint, destination: CGPoint, size: CGSize) {
        self.resource = resource
        self.size = size
        self.start = start

        position = start
        vector = CGVector(dx: destination.x - start.x, dy: 0)
    }
}

final class Sky {
    let creationDate = Date()

    var clouds = [Cloud]()

    private static let availableClouds: [ImageResource] = [.cloud1, .cloud2, .cloud3, .cloud4]

    private static let numberOfCloudsPerEdge = 20
    private static let widthRange: ClosedRange<CGFloat> = 0.15...0.30
    private static let xLeadingStartPoint: CGFloat = -0.40
    private static let xLeadingAxis: ClosedRange<CGFloat> = -0.10...0.40
    private static let xTrailinggStartPoint: CGFloat = 1.10
    private static let xTrailingAxis: ClosedRange<CGFloat> = 0.40...1.05
    private static let yAxis: ClosedRange<CGFloat> = -0.05...0.18

    init() {
        for _ in 0..<Self.numberOfCloudsPerEdge {
            clouds.append(generateCloud(xStartPoint: Self.xLeadingStartPoint, xAxis: Self.xLeadingAxis))
        }
        for _ in 0..<Self.numberOfCloudsPerEdge {
            clouds.append(generateCloud(xStartPoint: Self.xTrailinggStartPoint, xAxis: Self.xTrailingAxis))
        }
    }

    private func generateCloud(xStartPoint: CGFloat, xAxis: ClosedRange<CGFloat>) -> Cloud {
        let resource = Self.availableClouds.randomElement()!

        let y = CGFloat.random(in: Self.yAxis)

        let start = CGPoint(x: xStartPoint, y: y)
        let destination = CGPoint(x: .random(in: xAxis), y: y)

        let width = CGFloat.random(in: Self.widthRange)
        let size = CGSize(width: width, height: width / 2)

        return Cloud(resource: resource, start: start, destination: destination, size: size)
    }

    func update(to date: Date) {
        let delta = date.timeIntervalSinceReferenceDate - creationDate.timeIntervalSinceReferenceDate
        guard delta <= OnboardingView.AnimationConsants.cloudsInterval else { return }

        for cloud in clouds {
            let xTraveled = (cloud.vector.dx * delta) / OnboardingView.AnimationConsants.cloudsInterval
            cloud.position = CGPoint(x: cloud.start.x + xTraveled, y: cloud.position.y)
        }
    }
}

struct WeatherBackgroundView: View {
    @State private var sky = Sky()

    var body: some View {
        TimelineView(.animation) { timelineContext in
            Canvas { context, size in
                sky.update(to: timelineContext.date)
                context.opacity = 0.8

                for cloud in sky.clouds {
                    let rect = CGRect(
                        x: size.width * cloud.position.x,
                        y: size.height * cloud.position.y,
                        width: size.width * cloud.size.width,
                        height: size.height * cloud.size.height
                    )

                    context.draw(Image(cloud.resource), in: rect)
                }
            }
        }
    }
}

#Preview {
    WeatherBackgroundView()
}
