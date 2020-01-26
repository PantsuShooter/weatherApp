//
//  HomeModuleInteractor.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import SwiftLocation
import MapKit

final class HomeModuleInteractor: HomeModuleInteractorInput {
    
    public var output: HomeModuleInteractorOutput!
    
    func startRequestLocationCoordinates() {
        LocationManager.shared.locateFromGPS(.continous, accuracy: .any) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.output.coordinatesUpdateWith(error: error)
            case .success(let places):
                self?.output.coordinatesUpdateWith(coordinate: places.coordinate)
            }
        }
    }
}
