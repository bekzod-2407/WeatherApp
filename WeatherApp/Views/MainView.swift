//
//  MainView.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 29/07/22.
//

import UIKit

class MainView: UIView {
    
    private lazy var backgroundImage: UIImageView = {
        var view  = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.image = Images.backgroundImage.image
        return view
    }()
    
    private lazy var textFieldStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [locationButton,searchTextField,searchButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 3
        return view
    }()
    
    lazy var locationButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .black
        view.titleLabel?.font = .monospacedSystemFont(ofSize: 40, weight: .bold)
        view.setImage(.init(systemName: "location.circle.fill"), for: .normal)
     
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.placeholder = "Search"
        view.font =  .monospacedSystemFont(ofSize: 24, weight: .medium)
        return view
    }()
    
    lazy var searchButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.tintColor = .black
        view.setBackgroundImage(.init(systemName: "magnifyingglass"), for: .normal)
        return view
    }()
    
    lazy var conditionImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .init(systemName: "sun.max")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var labelStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [temperatureLabel,temperatureLabel2])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 2
        return view
    }()
    
    lazy var temperatureLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "21°"
        view.font = .systemFont(ofSize: 85.0, weight: .bold)
        view.textColor = .label
        return view
    }()
    
    lazy var temperatureLabel2: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "C"
        view.font = .systemFont(ofSize: 85.0, weight: .bold)
        view.textColor = .label
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "London"
        view.font = .systemFont(ofSize: 65.0, weight: .light)
        view.textColor = .label
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSubViews() {
        self.addSubview(backgroundImage)
        self.addSubview(textFieldStack)
        self.addSubview(conditionImage)
        self.addSubview(labelStack)
        self.addSubview(cityLabel)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            textFieldStack.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
            textFieldStack.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            textFieldStack.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20),
            
            conditionImage.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor,constant: 10),
            conditionImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            labelStack.topAnchor.constraint(equalTo: conditionImage.bottomAnchor,constant: 10),
            labelStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: labelStack.bottomAnchor,constant: 10),
            cityLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalTo: locationButton.heightAnchor),
            
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalTo: locationButton.heightAnchor)
        
        ])
        
    }
    
}
