//
//  Date+Exensions.swift
//  WeatherWidgetExtension
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import Foundation

extension Date {
    func timeOnly() -> String {
        let fromData = self
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: fromData)
    }
}
