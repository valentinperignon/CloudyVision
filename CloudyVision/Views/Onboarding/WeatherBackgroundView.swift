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

    init() {
        for _ in 0..<OnboardingConstants.numberOfCloudsPerEdge {
            clouds.append(generateCloud(.leading))
        }
        for _ in 0..<OnboardingConstants.numberOfCloudsPerEdge {
            clouds.append(generateCloud(.trailing))
        }
    }

    private func generateCloud(_ edge: Edge) -> Cloud {
        let resource = Self.availableClouds.randomElement()!

        let y = CGFloat.random(in: OnboardingConstants.yAxis)

        let start = CGPoint(x: OnboardingConstants.xStartPoint[edge]!, y: y)
        let destination = CGPoint(x: .random(in: OnboardingConstants.xAxis[edge]!), y: y)

        let width = CGFloat.random(in: OnboardingConstants.widthRange)
        let size = CGSize(width: width, height: width / 2)

        return Cloud(resource: resource, start: start, destination: destination, size: size)
    }

    func update(to date: Date) {
        let delta = date.timeIntervalSinceReferenceDate - creationDate.timeIntervalSinceReferenceDate
        guard delta <= OnboardingConstants.cloudsInterval else { return }

        for cloud in clouds {
            let xTraveled = (cloud.vector.dx * delta) / OnboardingConstants.cloudsInterval
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
