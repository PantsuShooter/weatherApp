//
//  HomeModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class HomeModulePresenter: HomeModuleViewOutput {
    
    weak var view:  HomeModuleViewInput!
    var interactor: HomeModuleInteractorInput!
    var router:     HomeModuleRouterInput!
    
}

extension HomeModulePresenter: HomeModuleInteractorOutput {}
