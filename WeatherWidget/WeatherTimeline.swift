//
//  WeatherTimeline.swift
//  WeatherWidgetExtension
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import WidgetKit
import SwiftUI

struct WeatherTimeline: TimelineProvider {
    typealias Entry = WeatherEntry
    
    let weatherDefalutEntryData = Weather(name: "SF", temperature: 67, unit: "F", description: "Cloudy")
    
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(), weather: weatherDefalutEntryData)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        let entry = WeatherEntry(date: Date(), weather: weatherDefalutEntryData)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 30, to: currentDate)!
        
        WeatherService().getWeather { (result) in
            let weather: Weather
            
            if case .success(let fetchedData) = result {
                weather = fetchedData?.first ?? weatherDefalutEntryData
            }
            else{
                weather = Weather(name: "SF", temperature: 0, unit: "F", description: "Error getting weather info")
            }
            
            let entry = WeatherEntry(date: currentDate, weather: weather)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}
