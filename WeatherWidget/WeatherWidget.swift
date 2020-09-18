//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidget: Widget {
    private var kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherTimeline()) { entry in
            WeatherEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("SF Weather Widget")
        .description("This widget displays current weather for SF")
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: WeatherEntry(date: Date(), weather: Weather(name: "This Afternoon", temperature: 71, unit: "F", description: "Partly Sunny")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
