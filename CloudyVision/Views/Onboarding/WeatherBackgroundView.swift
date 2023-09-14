//
//  WeatherBackgroundView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 10/09/2023.
//

import SwiftUI

struct Cloud {
    let resource: ImageResource
    let position: CGPoint
    let destination: CGPoint
    let size: CGSize
    let show: Bool
    let edge: Edge
}

final class Sky {
    let creationDate = Date()
    var clouds = [Cloud]()

    private static let availableClouds: [ImageResource] = [.cloud1, .cloud2, .cloud3, .cloud4]

    init() {
        // Generate leading side
        for _ in 0..<6 {
            guard let resource = Self.availableClouds.randomElement() else { continue }
            
            let y = CGFloat.random(in: 0...0.2)
            let destinationX = CGFloat.random(in: 0...0.5)

            let width = CGFloat.random(in: 120...240)
            let heigth = width / 2

            let cloud = Cloud(resource: resource,
                              position: CGPoint(x: 0, y: y),
                              destination: CGPoint(x: destinationX, y: y),
                              size: CGSize(width: width, height: heigth),
                              show: true,
                              edge: .leading)
            clouds.append(cloud)
        }
    }

    func update(to date: Date) {
        let delta = date.timeIntervalSinceReferenceDate - creationDate.timeIntervalSinceReferenceDate

        for cloud in clouds {
            // TODO: COmpute new positions
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
                    let resolvedImage = context.resolve(Image(cloud.resource))
                }
            }
        }
    }
}

#Preview {
    WeatherBackgroundView()
}
