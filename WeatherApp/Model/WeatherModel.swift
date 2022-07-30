//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 30/07/22.
//

import Foundation

struct WeatherModel {
    var conditionId:Int
    var temperature: Double
    var cityName: String
    
    var conditionName: String {
        switch conditionId {
        case 200...232: print(conditionId); return "cloud.bolt"
        case 300...321: print(conditionId); return "cloud.drizzle"
        case 500...531: print(conditionId); return "cloud.rain"
        case 600...622: print(conditionId); return "cloud.snow"
        case 701...781:  print(conditionId);return "cloud.fog"
        case 800: print(conditionId); return "sun.max"
        case 801...804: print(conditionId); return "cloud.bolt"
        default: print(conditionId);  return "cloud.fill"
        }
    }
    var temperatureString: String {
        return String(format: "%.1 f", temperature)
    }
}
