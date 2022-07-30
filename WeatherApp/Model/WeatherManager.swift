//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 30/07/22.
//

import Foundation

struct WeatherManager {
    let key = "cf4bca5b7be93069b1ce9986b4048b0d"
    lazy var url = "https://api.openweathermap.org/data/2.5/weather?appid=\(key)&units=metric"
    
    mutating func fetchWeathet(for cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(withUrl: urlString)
    }
    
    func performRequest(withUrl urlString: String) {
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task  = session.dataTask(with: url) { data, response, err in
            guard let safeData = data else {return}
            parseJSON(from: safeData)
            if err != nil {
                print(err!)
                return
            }
          }
        task.resume()
    }
    func parseJSON(from weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decoderData =  try decoder.decode(WeatherData.self, from: weatherData)
            print(decoderData.weather[0].description)
        } catch {
            print(error.localizedDescription)
        }
    }
}
