//
//  WeatheIconName.swift
//  WetherApp
//
//  Created by Home on 06.02.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

enum WeatheIconName: String, CaseIterable {
        
    case Clear = "01"
    case ClearN = "01n"
    case Cloud = "02"
    case CloudN = "02n"

    case Cloudy = "03"
    case CloudyN = "03n"

    case Clouds = "04"
    case CloudsN = "04n"

    case Rain = "10"
    case RainN = "10n"

    case HeavyRain = "09"
    case HeavyRainN = "09n"

    case Thunderstorm = "11"
    case ThunderstormN = "11n"

    case Snow = "13"
    case SnowN = "13n"

    case Mist = "50"
    case MistN = "50n"

    
    var animationLotiJsonName: String {
        
        switch self {
        case .Clear, .ClearN:
            return "4804-weather-sunny"
        case .Cloud, .CloudN, .Clouds, .CloudsN:
            return "4806-weather-windy"
        case .Cloudy, .CloudyN:
            return "4800-weather-partly-cloudy"
        case .Rain, .RainN:
            return "4801-weather-partly-shower"
        case .HeavyRain, .HeavyRainN:
            return "4792-weather-stormshowersday"
        case .Thunderstorm, .ThunderstormN:
            return "4803-weather-storm"
        case .Snow, .SnowN:
            return "4793-weather-snow"
        case .Mist, .MistN:
            return "4791-foggy"
        }
    }
}
