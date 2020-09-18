//
//  WeatherEntryView.swift
//  WeatherWidgetExtension
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import WidgetKit
import SwiftUI

struct WeatherEntryView: View {
    let entry: WeatherEntry
    var body: some View {
        ZStack {
            VStack {
                Text("San Francisco")
                Text("\(entry.weather.temperature)º\(entry.weather.unit)")
                    .font(.largeTitle)
                Text(getWeatherIcon(conditionString: entry.weather.description))
                    .padding(.top, 2)
                Text(entry.weather.description)
                    .font(.footnote)
                HStack {
                    Spacer()
                    Text("updated: \(entry.date.timeOnly())")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray.opacity(0.5))
                }
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func getWeatherIcon(conditionString: String) -> String {
        let current = conditionString.lowercased()
        switch current {
        case _ where current.contains("partly sunny"):
            return "🌤"
        case _ where current.contains("cloudy"):
            return "☁️"
        case _ where current.contains("drizzle"):
            return "🌧"
        case _ where current.contains("sunny"):
            return "🌤"
        case _ where current.contains("clear"):
            return "☀️"
        default:
            return "🚫"
        }
    }
}

