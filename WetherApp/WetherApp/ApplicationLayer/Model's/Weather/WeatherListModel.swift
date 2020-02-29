//
//  WeatherListModel.swift
//  WetherApp
//
//  Created by Home on 22.02.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class WeatherListModel: Decodable {
    
    let deltaTiming: Int
    let main : MainWeatherModel
    let weather: [WeatherInfoModel]
    let clouds: CloudsWeatherModel
    let wind: WindWeatherModel
    let sys: SystemWeatherModel
    let deltaTimingText: String
    
    private enum CodingKeys: String, CodingKey {
              
        case deltaTiming = "dt"
        case main
        case weather
        case clouds
        case wind
        case sys
        case deltaTimingText = "dt_txt"
    }
}
