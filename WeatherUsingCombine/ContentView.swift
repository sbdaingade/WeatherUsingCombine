//
//  ContentView.swift
//  WeatherUsingCombine
//
//  Created by Sachin Daingade on 16/06/21.
//

import SwiftUI
import Combine


struct ContentView: View {
    
    @ObservedObject var viewModel: WeeklyWeatherViewModel

    init(viewModel: WeeklyWeatherViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                
                searchField
                
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weather ⛅️")

        }
        
    }
}

private extension ContentView {
  var searchField: some View {
    HStack(alignment: .center) {
      TextField("e.g. Pune", text: $viewModel.city)
    }
  }

  var forecastSection: some View {
    Section {
        ForEach(viewModel.dataSource, content: WeeklyWeatherRow.init(weeklyWeatherState:))
    }
  }

//  var cityHourlyWeatherSection: some View {
//    Section {
//      NavigationLink(destination: viewModel.currentWeatherView) {
//        VStack(alignment: .leading) {
//          Text(viewModel.city)
//          Text("Weather today")
//            .font(.caption)
//            .foregroundColor(.gray)
//        }
//      }
//    }
//  }

  var emptySection: some View {
    Section {
      Text("No results")
        .foregroundColor(.gray)
    }
  }
}

