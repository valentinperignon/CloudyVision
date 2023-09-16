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
    let destination: CGPoint
    let size: CGSize
    let edge: Edge
    let vector: CGVector

    var position: CGPoint

    init(resource: ImageResource, start: CGPoint, destination: CGPoint, size: CGSize, edge: Edge) {
        self.resource = resource
        self.start = start
        self.destination = destination
        self.size = size
        self.edge = edge

        position = start
        vector = CGVector(dx: destination.x - start.x, dy: 0)
    }
}

final class Sky {
    let creationDate = Date()
    var clouds = [Cloud]()

    private static let availableClouds: [ImageResource] = [.cloud1, .cloud2, .cloud3, .cloud4]

    private static let numberOfCloudsPerEdge = 16
    private static let widthRange: ClosedRange<CGFloat> = 0.15...0.3
    private static let xLeadingStartingPoint: CGFloat = -0.3
    private static let xLeadingAxis: ClosedRange<CGFloat> = -0.05...0.4
    private static let yAxis: ClosedRange<CGFloat> = -0.05...0.15

    init() {
        generateLeadingClouds()
    }

    private func generateLeadingClouds() {
        let edge = Edge.leading

        for _ in (0..<Self.numberOfCloudsPerEdge) {
            guard let resource = Self.availableClouds.randomElement() else { continue }

            let y = CGFloat.random(in: Self.yAxis)

            let start = CGPoint(x: Self.xLeadingStartingPoint, y: y)
            let xDestination = CGFloat.random(in: Self.xLeadingAxis)
            let destination = CGPoint(x: xDestination, y: y)

            let width = CGFloat.random(in: Self.widthRange)
            let size = CGSize(width: width, height: width / 2)

            let cloud = Cloud(resource: resource, start: start, destination: destination, size: size, edge: edge)
            clouds.append(cloud)
        }
    }

    private func generateTrailingClouds() {
        // TODO: Generate trailing clouds
    }

    func update(to date: Date) {
        let delta = date.timeIntervalSinceReferenceDate - creationDate.timeIntervalSinceReferenceDate
        guard delta <= OnboardingView.AnimationConsants.cloudsInterval else { return }

        print(delta)

        for cloud in clouds {
            if cloud.edge == .leading {
                updateLeading(cloud: cloud, delta: delta)
            } else {
                // Hehe
            }
        }
    }

    private func updateLeading(cloud: Cloud, delta: TimeInterval) {
        let xTraveled = (cloud.vector.dx * delta) / OnboardingView.AnimationConsants.cloudsInterval
        cloud.position = CGPoint(x: cloud.start.x + xTraveled, y: cloud.position.y)
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
                    let resolvedImage = context.resolve(Image(cloud.resource))
                    let rect = CGRect(
                        x: size.width * cloud.position.x,
                        y: size.height * cloud.position.y,
                        width: size.width * cloud.size.width,
                        height: size.height * cloud.size.height
                    )

                    context.draw(resolvedImage, in: rect)
                }
            }
        }
    }
}

#Preview {
    WeatherBackgroundView()
}
