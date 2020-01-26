//
//  HomeModuleInteractorOutput.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import MapKit

protocol HomeModuleInteractorOutput: class {
    
    func coordinatesUpdateWith(error: Error)
    func coordinatesUpdateWith(coordinate: CLLocationCoordinate2D)
    
}
