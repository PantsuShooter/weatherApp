//
//  WeatherModel.swift
//  WetherApp
//
//  Created by Home on 26.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class WeatherIndicationsModel: Decodable {
        
    let weather: [WeatherInfoModel]
    let base: String
    let main : MainWeatherModel
    let wind: WindWeatherModel
    let clouds: CloudsWeatherModel
    let dt: Int
    let sys: SystemWeatherModel
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    required init(weather: [WeatherInfoModel], base: String, main: MainWeatherModel,wind: WindWeatherModel, clouds: CloudsWeatherModel, dt: Int, sys: SystemWeatherModel, timezone: Int, id: Int, name: String, cod: Int) {
        
        self.weather = weather
        self.base = base
        self.main = main
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
}
