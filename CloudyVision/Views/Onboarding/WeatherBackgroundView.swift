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

                drawSun(in: &context, with: size, sky: sky)
                drawRainbow(in: &context, with: size)
                drawClouds(in: &context, with: size)
            }
        }
    }

    private func drawSun(in context: inout GraphicsContext, with size: CGSize, sky: Sky) {
        context.opacity = sky.sunOpacity

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

    private func drawClouds(in context: inout GraphicsContext, with size: CGSize) {
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

    private func drawRainbow(in context: inout GraphicsContext, with size: CGSize) {
        let layers: [(color: Color, opacity: CGFloat)] = [
            (.purple, 0.2), (.indigo, 0.2), (.blue, 0.2), (.green, 0.3), (.yellow, 0.3), (.orange, 0.3), (.red, 0.3)
        ]

        for index in layers.indices {
            let layer = layers[index]

            context.opacity = layer.opacity
            drawRaibowColor(in: context, with: size, index: index, color: layer.color)
        }
    }

    private func drawRaibowColor(in context: GraphicsContext, with size: CGSize, index: Int, color: Color) {
        let colorSize: CGFloat = 16

        let leadingPoint = CGPoint(x: 0, y: size.height * 0.7 - colorSize * CGFloat(index))
        let trailingPoint = CGPoint(x: size.width, y: size.height * 0.7 - colorSize *  CGFloat(index))

        let curvePath = Path { path in
            let leadingTranslation = CGAffineTransform(translationX: size.width * 0.2, y: -size.height * 0.5 + colorSize * CGFloat(index) * 0.33)
            let trailingTransition = CGAffineTransform(translationX: size.width * -0.2, y: size.height * -0.5 + colorSize * CGFloat(index) * 0.33)

            path.move(to: leadingPoint)
            path.addCurve(to: trailingPoint, control1: leadingPoint.applying(leadingTranslation), control2: trailingPoint.applying(trailingTransition))

            let upperTrailingPoint = trailingPoint.applying(.init(translationX: colorSize, y: 0))
            let upperLeadingPoint = leadingPoint.applying(.init(translationX: -colorSize, y: 0))

            path.addLine(to: upperTrailingPoint)

            let upperTrailingTranslation = trailingTransition.translatedBy(x: 0, y: -colorSize)
            let upperLeadingTranslation = leadingTranslation.translatedBy(x: 0, y: -colorSize)

            path.addCurve(to: upperLeadingPoint, control1: upperTrailingPoint.applying(upperTrailingTranslation), control2: upperLeadingPoint.applying(upperLeadingTranslation))

            path.addLine(to: leadingPoint)
        }

        context.fill(curvePath, with: .color(color))
    }
}

#Preview {
    WeatherBackgroundView()
}
