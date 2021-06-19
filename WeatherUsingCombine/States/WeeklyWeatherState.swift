//
//  WeeklyWeatherState.swift
//  WeatherUsingCombine
//
//  Created by Sachin Daingade on 17/06/21.
//

import Foundation
import SwiftUI

struct WeeklyWeatherState: Identifiable {
  private let item: WeeklyForecastResponse.Item
  
  var id: String {
    return day + temperature + title
  }
  
  var day: String {
    return dayFormatter.string(from: item.date)
  }
  
  var month: String {
    return monthFormatter.string(from: item.date)
  }
  
  var temperature: String {
    return String(format: "%.1f", item.main.temp)
  }
  
  var title: String {
    guard let title = item.weather.first?.main.rawValue else { return "" }
    switch item.weather.first?.main{
    case .clear:
      return "\(title) 🌞"
    case .clouds:
      return "\(title) 🌥"
    case .rain:
      return "\(title) 🌧"
    case .none:
      return ""
    }
  }
  
  var fullDescription: String {
    guard let description = item.weather.first?.weatherDescription else { return "" }
    return description
  }
  
  init(item: WeeklyForecastResponse.Item) {
    self.item = item
  }
}

// Used to hash on just the day in order to produce a single view model for each
// day when there are multiple items per each day.
extension WeeklyWeatherState: Hashable {
  static func == (lhs: WeeklyWeatherState, rhs: WeeklyWeatherState) -> Bool {
    return lhs.day == rhs.day
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.day)
  }
}
