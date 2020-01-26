//
//  NextDaysInformationModulePresenter.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class NextDaysInformationModulePresenter: NextDaysInformationModuleViewOutput {
    
    weak var view:  NextDaysInformationModuleViewInput!
    var interactor: NextDaysInformationModuleInteractorInput!
    var router:     NextDaysInformationModuleRouterInput!
    
}

extension NextDaysInformationModulePresenter: NextDaysInformationModuleInteractorOutput {}
