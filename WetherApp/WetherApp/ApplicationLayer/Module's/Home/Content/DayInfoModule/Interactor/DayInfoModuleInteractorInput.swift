//
//  DayInfoModuleInteractorInput.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

protocol DayInfoModuleInteractorInput: class {
    
    func requestWeatherBy(latitude :Double, andLongitude: Double)
    func requestHourlyWeatherBy(latitude :Double, andLongitude: Double)
    
}
