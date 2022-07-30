//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 29/07/22.
//

import UIKit
import CoreLocation
class MainViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    private lazy var mainView: MainView = {
        var view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        setupSubViews()
        addTarget()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }


    private func setupSubViews() {
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func addTarget() {
        mainView.searchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        mainView.locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)

    }
    
    @objc private func buttonTapped() {
        mainView.searchTextField.endEditing(true)
        print(mainView.searchTextField.text!)
    }
    @objc private func locationButtonTapped() {
        locationManager.requestLocation()
    }
    
}
extension MainViewController: UITextFieldDelegate, WeatherManagerDelegare, CLLocationManagerDelegate {
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.mainView.temperatureLabel.text = "\(weather.temperatureString)°"
            self.mainView.conditionImage.image = .init(systemName: weather.conditionName)
            self.mainView.cityLabel.text = "\(weather.cityName)"
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something!"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let cityName = textField.text else {return}
        weatherManager.fetchWeather(for: cityName)  
        textField.text = ""
    }
    //MARK: - locatinManager
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lon = location.coordinate.longitude
            let lat = location.coordinate.latitude
            print(lat,lon)
            weatherManager.fetchWeatherWithLocationManager(latitide: lat, longitude: lon)
            
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

}
