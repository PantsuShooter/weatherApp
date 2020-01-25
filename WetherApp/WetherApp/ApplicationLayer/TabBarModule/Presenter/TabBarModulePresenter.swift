//
//  TabBarModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class TabBarModulePresenter: TabBarModuleViewOutput {
    
    weak var view:  TabBarModuleViewInput!
    var interactor: TabBarModuleInteractorInput!
    var router:     TabBarModuleRouterInput!
    
}

extension TabBarModulePresenter: TabBarModuleInteractorOutput {}
