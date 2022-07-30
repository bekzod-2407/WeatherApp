//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 30/07/22.
//

import Foundation
protocol WeatherManagerDelegare {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegare?
    let key = "cf4bca5b7be93069b1ce9986b4048b0d"
    lazy var url = "https://api.openweathermap.org/data/2.5/weather?appid=\(key)&units=metric"
    
    mutating func fetchWeather(for cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(withUrl: urlString)
    }
    
    func performRequest(withUrl urlString: String) {
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task  = session.dataTask(with: url) { data, response, err in
            guard let safeData = data else {return}
            if let weather =  parseJSON(from: safeData) {
                self.delegate?.didUpdateWeather(self, weather: weather)
            } 
            if err != nil {
                delegate?.didFailWithError(error: err!)
                return
            }
        }
        task.resume()
    }
    func parseJSON(from weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData =  try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let cityName = decoderData.name
            let weatherModel = WeatherModel(conditionId: id, temperature: temp, cityName: cityName)
            return weatherModel
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
