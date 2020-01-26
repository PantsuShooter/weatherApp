//
//  HomeModuleInteractorInput.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

protocol HomeModuleInteractorInput: class {
    
    func startRequestLocationCoordinates()

    func requestWeatherBy(latitude :Double, andLongitude: Double)
    
}
