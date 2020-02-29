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
    var hourlyWeather = [WeatherListModel]()
    
    var currentCoordinate: CLLocationCoordinate2D?
    
    
    func setUpdated(coordinates: CLLocationCoordinate2D) {
        self.currentCoordinate = coordinates
        interactor.requestWeatherBy(latitude: coordinates.latitude, andLongitude: coordinates.longitude)
        interactor.requestHourlyWeatherBy(latitude: coordinates.latitude, andLongitude: coordinates.longitude)
    }
    
    func getCurrentWeather() -> WeatherIndicationsModel? {
        return currentWeather
    }
    
    func getHourlyWeatherCount() -> Int {
        return hourlyWeather.count
    }
    
    func getHourlyWeatherAt(index: Int) -> WeatherListModel? {
        return hourlyWeather[index]
    }
}

extension DayInfoModulePresenter: DayInfoModuleInteractorOutput {
    
    func hourlyWeatherUpdateWith(indications: WeatherHourIndicationsModel) {
        self.hourlyWeather = indications.weatherList
        view.hourlyWeatherWasUpdated()
    }
    
    func weatherUpdateWith(indications: WeatherIndicationsModel) {
        self.currentWeather = indications
        view.weatherWasUpdated()
    }
    
    func weatherUpdateWith(error: Error) {
        debugPrint(error)
    }
}
