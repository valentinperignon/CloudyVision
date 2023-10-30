//
//  WeatherDataView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 30/10/2023.
//

import CVCore
import SwiftUI

struct WeatherDataView: View {
    let weather: WeatherData

    var body: some View {
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
    }
}
