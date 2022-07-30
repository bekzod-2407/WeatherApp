//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 29/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    
    private lazy var mainView: MainView = {
        var view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addTarget()
    }


    private func setupSubViews() {
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        mainView.searchTextField.delegate = self
    }
    
    private func addTarget() {
        mainView.searchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        mainView.searchTextField.endEditing(true)
        print(mainView.searchTextField.text!)
    }
    
}
extension ViewController: UITextFieldDelegate {
    
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
        weatherManager.fetchWeathet(for: cityName)  
        textField.text = ""
    }

}
