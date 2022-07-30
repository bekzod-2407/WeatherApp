//
//  MainView.swift
//  WeatherApp
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
        view.spacing = 8
        return view
    }()
    
    lazy var locationButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .label
        view.setBackgroundImage(.init(systemName: "location.circle.fill"), for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
       
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.placeholder = "Search"
        view.autocapitalizationType = .words
        view.returnKeyType = .go
        view.font =  .monospacedSystemFont(ofSize: 24, weight: .medium)
        view.backgroundColor = .systemFill
        view.textColor = .black
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var searchButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.tintColor = .label
        view.setBackgroundImage(.init(systemName: "magnifyingglass"), for: .normal)
        return view
    }()
    
    lazy var conditionImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .init(systemName: "sun.max")
        view.contentMode = .scaleAspectFill
        view.tintColor = Colors.weatherColor.color
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
        view.font = .systemFont(ofSize: 85.0, weight: .regular)
        view.textColor = .label
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "London"
        view.font = .systemFont(ofSize: 35.0, weight: .light)
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
            
            textFieldStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            textFieldStack.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 30),
            textFieldStack.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30),
            
            conditionImage.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor,constant: 20),
            conditionImage.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30),
            conditionImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.14),
            conditionImage.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.3),
            labelStack.topAnchor.constraint(equalTo: conditionImage.bottomAnchor,constant: 20),
            labelStack.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30),
            
            cityLabel.topAnchor.constraint(equalTo: labelStack.bottomAnchor,constant: 10),
            cityLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30),
            
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalTo: locationButton.heightAnchor),
            
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
}
