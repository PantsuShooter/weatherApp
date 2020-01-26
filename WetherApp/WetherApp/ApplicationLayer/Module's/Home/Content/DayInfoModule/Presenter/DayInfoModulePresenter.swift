//
//  DayInfoModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class DayInfoModulePresenter: DayInfoModuleViewOutput {
    
    weak var view:  DayInfoModuleViewInput!
    var interactor: DayInfoModuleInteractorInput!
    var router:     DayInfoModuleRouterInput!
    
}

extension DayInfoModulePresenter: DayInfoModuleInteractorOutput {}
