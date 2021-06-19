//
//  WeeklyWeatherRow.swift
//  WeatherUsingCombine
//
//  Created by Sachin Daingade on 17/06/21.
//

import SwiftUI

struct WeeklyWeatherRow: View {
 
    private let weeklyWeatherState: WeeklyWeatherState
    
    init(weeklyWeatherState: WeeklyWeatherState) {
        self.weeklyWeatherState = weeklyWeatherState
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("\(weeklyWeatherState.day)")
                Text("\(weeklyWeatherState.month)")
            }
            
            VStack(alignment: .leading) {
                Text("\(weeklyWeatherState.title)")
                    .font(.body)
                Text("\(weeklyWeatherState.fullDescription)")
                    .font(.footnote)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(weeklyWeatherState.temperature)°")
                .font(.title)
        }
    }
}

    


