//
//  HomeModuleViewInput.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import MapKit

protocol HomeModuleViewInput: class {
    
    func receivedNew(coordinates: CLLocationCoordinate2D)
        
}
