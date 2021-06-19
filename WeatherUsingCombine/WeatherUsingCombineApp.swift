//
//  WeatherUsingCombineApp.swift
//  WeatherUsingCombine
//
//  Created by Sachin Daingade on 16/06/21.
//

import SwiftUI

@main
struct WeatherUsingCombineApp: App {
    var body: some Scene {
        WindowGroup {
            let fetcher = WeatherFetcher()
            let viewModel = WeeklyWeatherViewModel(weatherFetcher: fetcher)
            ContentView(viewModel: viewModel)
        }
    }
}
