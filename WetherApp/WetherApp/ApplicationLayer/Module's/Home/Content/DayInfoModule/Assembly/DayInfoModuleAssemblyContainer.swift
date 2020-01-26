//
//  DayInfoModuleAssemblyContainer.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class DayInfoAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(DayInfoModuleInteractor.self) { (r, presenter: DayInfoModulePresenter) in
            let interactor = DayInfoModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(DayInfoModuleRouter.self) { (r, viewController: DayInfoModuleView) in
            let router = DayInfoModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(DayInfoModulePresenter.self) { (r, viewController: DayInfoModuleView) in
            let presenter = DayInfoModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(DayInfoModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(DayInfoModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(DayInfoModuleView.self) { r, viewController in
            viewController.output = r.resolve(DayInfoModulePresenter.self, argument: viewController)
        }
    }
}
