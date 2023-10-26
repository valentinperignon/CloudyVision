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
                    VStack(spacing: 24) {
                        TodaySummuryView(currentWeather: weather.currentWeather, today: weather.today)
                            .padding(.vertical, 24)
                            .padding(.horizontal, 24)

                        HourlyForecastView(hourlyForecast: weather.hourlyForecast)
                            .padding(.horizontal, 24)

                        DailyForecastView(dailyForecast: weather.dailyForecast)
                    }
                }
            } else {
                ContentUnavailableView("Weather Unavailable",
                                       systemImage: "sun.max.trianglebadge.exclamationmark")
            }
        }
        .navigationTitle(place.name)
    }
}

#Preview(windowStyle: .automatic) {
    ForecastView(place: .appleCampus)
}
