//
//  DayInfoModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import MapKit

final class DayInfoModulePresenter: DayInfoModuleViewOutput {
    
    weak var view:  DayInfoModuleViewInput!
    var interactor: DayInfoModuleInteractorInput!
    var router:     DayInfoModuleRouterInput!
    
    var currentWeather: WeatherIndicationsModel?
    var currentCoordinate: CLLocationCoordinate2D?
    
    
    func setUpdated(coordinates: CLLocationCoordinate2D) {
        self.currentCoordinate = coordinates
        interactor.requestWeatherBy(latitude: coordinates.latitude, andLongitude: coordinates.longitude)
    }
}

extension DayInfoModulePresenter: DayInfoModuleInteractorOutput {
    
    func weatherUpdateWith(indications: WeatherIndicationsModel) {
        self.currentWeather = indications
        view.weatherWasUpdated()
    }
    
    func weatherUpdateWith(error: Error) {
        debugPrint(error)
    }
}
