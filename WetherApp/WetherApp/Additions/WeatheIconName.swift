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
    case ClearD = "01d"

    
    case Cloud = "02"
    case CloudN = "02n"
    case CloudD = "02d"

    case Cloudy = "03"
    case CloudyN = "03n"
    case CloudyD = "03d"

    case Clouds = "04"
    case CloudsN = "04n"
    case CloudsD = "04d"

    case Rain = "10"
    case RainN = "10n"
    case RainD = "10d"

    case HeavyRain = "09"
    case HeavyRainN = "09n"
    case HeavyRainD = "09d"

    case Thunderstorm = "11"
    case ThunderstormN = "11n"
    case ThunderstormD = "11d"

    case Snow = "13"
    case SnowN = "13n"
    case SnowD = "13d"
    
    case Mist = "50"
    case MistN = "50n"
    case MistD = "50d"
    
    var animationLotiJsonName: String {
        
        switch self {
        case .Clear, .ClearN, .ClearD:
            return "4804-weather-sunny"
        case .Cloud, .CloudN, .CloudD, .Clouds, .CloudsN, .CloudsD:
            return "4806-weather-windy"
        case .Cloudy, .CloudyN, .CloudyD:
            return "4800-weather-partly-cloudy"
        case .Rain, .RainN, .RainD:
            return "4801-weather-partly-shower"
        case .HeavyRain, .HeavyRainN, .HeavyRainD:
            return "4792-weather-stormshowersday"
        case .Thunderstorm, .ThunderstormN, .ThunderstormD:
            return "4803-weather-storm"
        case .Snow, .SnowN, .SnowD:
            return "4793-weather-snow"
        case .Mist, .MistN, .MistD:
            return "4791-foggy"
        }
    }
}
