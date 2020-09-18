//
//  Weather.swift
//  WeatherWidgetExtension
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import Foundation

struct Weather: Codable {
    let name: String
    let temperature: Int
    let unit: String
    let description: String
}
