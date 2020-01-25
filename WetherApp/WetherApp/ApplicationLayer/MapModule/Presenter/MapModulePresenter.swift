//
//  MapModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class MapModulePresenter: MapModuleViewOutput {
    
    weak var view:  MapModuleViewInput!
    var interactor: MapModuleInteractorInput!
    var router:     MapModuleRouterInput!
    
}

extension MapModulePresenter: MapModuleInteractorOutput {}
