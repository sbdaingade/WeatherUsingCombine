//
//  WeeklyWeatherViewModel.swift
//  WeatherUsingCombine
//
//  Created by Sachin Daingade on 17/06/21.
//

import Foundation
import SwiftUI
import Combine


class WeeklyWeatherViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var dataSource: [WeeklyWeatherState] = []

    private let weatherFetcher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()

    init( weatherFetcher: WeatherFetchable, scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel") ) {
        
      self.weatherFetcher = weatherFetcher
      $city
        .dropFirst(1)
        .debounce(for: .seconds(0.5), scheduler: scheduler)
        .sink(receiveValue: fetchWeather(forCity:))
        .store(in: &disposables)
    }

    func fetchWeather(forCity city: String) {
        weatherFetcher.weeklyWeatherForecast(forCity: city).map
        { response in
            response.list.map(WeeklyWeatherState.init)
        }
        .map(Array.removeDuplicates)
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure (let error):
                    print(error.localizedDescription)
                    self.dataSource = []
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.dataSource = forecast
            })
        .store(in: &disposables)
    }
  }

