//
//  HomeModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import MapKit

final class HomeModulePresenter: HomeModuleViewOutput {
    
    weak var view:  HomeModuleViewInput!
    var interactor: HomeModuleInteractorInput!
    var router:     HomeModuleRouterInput!
    
    var tempCurrentCoordinate: CLLocationCoordinate2D?
    var currentCoordinate: CLLocationCoordinate2D?
    
    var currentWeather: WeatherIndicationsModel?
    
    func startGettingCoordinates() {
        interactor.startRequestLocationCoordinates()
     }
}

extension HomeModulePresenter: HomeModuleInteractorOutput {
    
    func coordinatesUpdateWith(coordinate: CLLocationCoordinate2D) {
        
        guard let currentCoordinate = self.currentCoordinate else {
            debugPrint("Cordinate were obtained")
            interactor.requestWeatherBy(latitude: coordinate.latitude, andLongitude: coordinate.longitude)
            self.tempCurrentCoordinate = coordinate
            return
        }
        
        guard currentCoordinate.isEqual(coordinate) else {
            debugPrint("Coordinates have not changed")
            return
        }
    
        interactor.requestWeatherBy(latitude: coordinate.latitude, andLongitude: coordinate.longitude)
        self.tempCurrentCoordinate = coordinate
    }
    
    func coordinatesUpdateWith(error: Error) {
        debugPrint(error)
    }
    
    
    func weatherUpdateWith(indications: WeatherIndicationsModel) {
        self.currentWeather = indications
        self.currentCoordinate = tempCurrentCoordinate
        view.weatherWatsUpdatetWith(indications: indications)
    }
    
    func weatherUpdateWith(error: Error) {
        debugPrint(error)
    }
}
