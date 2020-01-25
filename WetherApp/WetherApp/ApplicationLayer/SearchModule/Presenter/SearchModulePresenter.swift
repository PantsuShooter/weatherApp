//
//  SearchModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class SearchModulePresenter: SearchModuleViewOutput {
    
    weak var view:  SearchModuleViewInput!
    var interactor: SearchModuleInteractorInput!
    var router:     SearchModuleRouterInput!
    
}

extension SearchModulePresenter: SearchModuleInteractorOutput {}
