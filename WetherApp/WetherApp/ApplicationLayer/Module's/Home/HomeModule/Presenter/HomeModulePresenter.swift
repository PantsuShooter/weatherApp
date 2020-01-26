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
    
    var currentCoordinate: CLLocationCoordinate2D?
    
    func startGettingCoordinates() {
        interactor.startRequestLocationCoordinates()
     }
}

extension HomeModulePresenter: HomeModuleInteractorOutput {
    
    func coordinatesUpdateWith(coordinate: CLLocationCoordinate2D) {
        
        guard let currentCoordinate = self.currentCoordinate else {
            debugPrint("Cordinate were obtained")
            view.receivedNew(coordinates: coordinate)
            self.currentCoordinate = coordinate
            return
        }
        
        guard currentCoordinate.isEqual(coordinate) else {
            debugPrint("Coordinates have not changed")
            return
        }
    
        view.receivedNew(coordinates: coordinate)
        self.currentCoordinate = coordinate
    }
    
    func coordinatesUpdateWith(error: Error) {
        debugPrint(error)
    }
}
