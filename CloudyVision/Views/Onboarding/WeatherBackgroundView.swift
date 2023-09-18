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
    var sunOpacity = 0.0

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

        let y = CGFloat.random(in: OnboardingConstants.cloudsYAxis)

        let start = CGPoint(x: OnboardingConstants.cloudsXStartPoint[edge]!, y: y)
        let destination = CGPoint(x: .random(in: OnboardingConstants.cloudsXAxis[edge]!), y: y)

        let width = CGFloat.random(in: OnboardingConstants.cloudsWidthRange)
        let size = CGSize(width: width, height: width / 2)

        return Cloud(resource: resource, start: start, destination: destination, size: size)
    }

    func update(to date: Date) {
        let delta = date.timeIntervalSinceReferenceDate - creationDate.timeIntervalSinceReferenceDate

        sunOpacity = max(0, min(delta - OnboardingConstants.sunStartAppearance, 1))

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

                context.opacity = sky.sunOpacity
                drawSun(in: context, with: size)

                context.opacity = 0.8
                drawClouds(in: context, with: size)
            }
        }
    }

    private func drawSun(in context: GraphicsContext, with size: CGSize) {
        let rect = CGRect(x: OnboardingConstants.sunX * size.width,
                          y: OnboardingConstants.sunY,
                          width: OnboardingConstants.sunSize.width,
                          height: OnboardingConstants.sunSize.height)

        let sun = Circle().path(in: rect)
        context.fill(sun,
                     with: .radialGradient(Gradient(colors: [.yellow, .yellow.opacity(0.7), .clear]),
                                           center: rect.center,
                                           startRadius: OnboardingConstants.sunRadius / 2,
                                           endRadius: OnboardingConstants.sunRadius))
    }

    private func drawClouds(in context: GraphicsContext, with size: CGSize) {
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

#Preview {
    WeatherBackgroundView()
}
