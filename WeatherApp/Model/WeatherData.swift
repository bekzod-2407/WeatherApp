//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 30/07/22.
//

import Foundation

struct WeatherData:Decodable {
    var name: String
    var main: Main
    var weather: [Weather]
}
struct Main:Decodable {
    var temp: Double
}

struct Weather:Decodable {
    var id: Int
    var description: String
}


