//
//  DayInfoModuleInteractorOutput.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

protocol DayInfoModuleInteractorOutput: class {
    
    func weatherUpdateWith(indications: WeatherIndicationsModel)
    func hourlyWeatherUpdateWith(indications: WeatherHourIndicationsModel)
    
    func weatherUpdateWith(error: Error)
    
}
