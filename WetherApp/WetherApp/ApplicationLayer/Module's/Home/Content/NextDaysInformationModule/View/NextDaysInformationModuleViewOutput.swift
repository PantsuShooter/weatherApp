//
//  NextDaysInformationModuleViewOutput.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import MapKit

protocol NextDaysInformationModuleViewOutput: class {
    func setUpdated(coordinates: CLLocationCoordinate2D)
}
