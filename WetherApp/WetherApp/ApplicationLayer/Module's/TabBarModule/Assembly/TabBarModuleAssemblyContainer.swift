//
//  TabBarModuleAssemblyContainer.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class TabBarAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(TabBarModuleInteractor.self) { (r, presenter: TabBarModulePresenter) in
            let interactor = TabBarModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(TabBarModuleRouter.self) { (r, viewController: TabBarModuleView) in
            let router = TabBarModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(TabBarModulePresenter.self) { (r, viewController: TabBarModuleView) in
            let presenter = TabBarModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(TabBarModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(TabBarModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(TabBarModuleView.self) { r, viewController in
            viewController.output = r.resolve(TabBarModulePresenter.self, argument: viewController)
        }
    }
}
