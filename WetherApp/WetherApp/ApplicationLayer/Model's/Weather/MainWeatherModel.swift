//
//  MainWeatherModel.swift
//  WetherApp
//
//  Created by Home on 26.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class MainWeatherModel: Decodable {
    
    let temp: Double
    let feelsLike: Double?
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Double?
    let groundLevel: Double?
    let tempKF: Double?
    
    private enum CodingKeys: String, CodingKey {
              
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case tempKF = "temp_kf"

    }
    
    required init(temp: Double, feelsLike: Double?, tempMin: Double, tempMax: Double, pressure: Int, humidity: Int, seaLevel: Double?, groundLevel: Double?, tempKF: Double?) {
        
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
        self.seaLevel = seaLevel
        self.groundLevel = groundLevel
        self.tempKF = tempKF
    }
}
