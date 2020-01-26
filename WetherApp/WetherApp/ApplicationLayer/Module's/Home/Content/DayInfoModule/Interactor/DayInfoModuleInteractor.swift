//
//  DayInfoModuleInteractor.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

final class DayInfoModuleInteractor: DayInfoModuleInteractorInput {
    
    public var output: DayInfoModuleInteractorOutput!
    
    func requestWeatherBy(latitude: Double, andLongitude: Double) {
        NetworkManager.shared.getWeatherBy(latitude: latitude, longitude: andLongitude) { [weak self] weather, error in
            if let weather = weather {
                self?.output.weatherUpdateWith(indications: weather)
            }
            if let error = error {
                self?.output.weatherUpdateWith(error: error)
            }
        }
    }
}
