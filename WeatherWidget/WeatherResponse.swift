//
//  WeatherResponse.swift
//  WeatherWidgetExtension
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import Foundation

struct WeatherResponse: Codable {
    let forecast: [Weather]
}
