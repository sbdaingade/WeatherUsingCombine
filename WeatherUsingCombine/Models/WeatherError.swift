//
//  WeatherError.swift
//  WeatherUsingCombine
//
//  Created by Sachin Daingade on 16/06/21.
//

import Foundation
public enum WeatherError:Error {
    case parsing(description: String)
    case network(description: String)
}
