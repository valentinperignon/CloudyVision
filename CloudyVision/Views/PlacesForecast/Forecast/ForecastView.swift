//
//  ForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

struct ForecastView: View {
    let place: Place

    var body: some View {
        Group {
            if let weather = place.weather {
                ScrollView {
                    VStack(spacing: 32) {
                        TodaySummuryView(currentWeather: weather.currentWeather, today: weather.today)

                        HourlyForecastView(hourlyForecast: weather.hourlyForecast)
                    }
                }
            } else {
                ContentUnavailableView("Weather Unavailable",
                                       systemImage: "sun.max.trianglebadge.exclamationmark")
            }
        }
        .padding()
        .navigationTitle(place.name)
    }
}

#Preview(windowStyle: .automatic) {
    ForecastView(place: .appleCampus)
}
