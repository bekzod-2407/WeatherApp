//
//  Constants.swift
//  WeatherApp
//
//  Created by Bekzod Qahhorov on 29/07/22.
//

import UIKit

enum Images {
    case backgroundImage
    var image: UIImage? {
        switch self {
        case .backgroundImage: return UIImage(named: "background")
        }
    }
}
enum Colors{
    case weatherColor
    
    var color: UIColor? {
        switch self {
        case .weatherColor: return UIColor(named: "weatherColour")
        }
    }
}

