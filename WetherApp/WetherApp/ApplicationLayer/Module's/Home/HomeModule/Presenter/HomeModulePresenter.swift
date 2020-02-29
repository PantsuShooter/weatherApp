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
    var lastUpdate: Date?
    
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
        
        guard !currentCoordinate.isEqual(coordinate) else {
            debugPrint("Coordinates have not changed")
            return
        }
        
        guard let lastTimeUpdate = self.lastUpdate else {
            view.receivedNew(coordinates: coordinate)
            self.currentCoordinate = coordinate
            self.lastUpdate = Date()
            return
        }
        
        guard let diff = Calendar.current.dateComponents([.minute], from: lastTimeUpdate, to: Date()).minute, diff > 15 else {
            debugPrint("Its no time yet")
            return
        }
        
        view.receivedNew(coordinates: coordinate)
        self.currentCoordinate = coordinate
        self.lastUpdate = Date()
    }
    
    func coordinatesUpdateWith(error: Error) {
        debugPrint(error)
    }
}
