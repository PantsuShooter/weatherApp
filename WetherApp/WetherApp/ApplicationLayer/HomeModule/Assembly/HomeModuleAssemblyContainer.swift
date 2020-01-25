//
//  HomeModuleAssemblyContainer.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class HomeAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(HomeModuleInteractor.self) { (r, presenter: HomeModulePresenter) in
            let interactor = HomeModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(HomeModuleRouter.self) { (r, viewController: HomeModuleView) in
            let router = HomeModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(HomeModulePresenter.self) { (r, viewController: HomeModuleView) in
            let presenter = HomeModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(HomeModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(HomeModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(HomeModuleView.self) { r, viewController in
            viewController.output = r.resolve(HomeModulePresenter.self, argument: viewController)
        }
    }
}
