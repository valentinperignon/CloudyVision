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
                    VStack(spacing: UIConstants.blocksSpacing) {
                        TodaySummuryView(currentWeather: weather.currentWeather, today: weather.today)
                            .padding(.vertical, 40)
                            .padding(.horizontal, UIConstants.blocksSpacing)

                        HourlyForecastView(hourlyForecast: weather.hourlyForecast)
                            .padding(.horizontal, UIConstants.blocksSpacing)

                        DailyForecastView(dailyForecast: weather.dailyForecast)

                        InfoRowView(feelsLike: weather.currentWeather.apparentTemperature,
                                    amount: weather.today.precipitationAmount,
                                    uvIndex: weather.currentWeather.uvIndex,
                                    humidity: weather.currentWeather.humidity,
                                    visibility: weather.currentWeather.visibility)
                    }
                    .padding(.bottom, UIConstants.blocksSpacing)
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
