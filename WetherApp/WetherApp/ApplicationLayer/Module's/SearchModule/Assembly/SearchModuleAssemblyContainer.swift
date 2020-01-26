//
//  SearchModuleAssemblyContainer.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class SearchAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(SearchModuleInteractor.self) { (r, presenter: SearchModulePresenter) in
            let interactor = SearchModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(SearchModuleRouter.self) { (r, viewController: SearchModuleView) in
            let router = SearchModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(SearchModulePresenter.self) { (r, viewController: SearchModuleView) in
            let presenter = SearchModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(SearchModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(SearchModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(SearchModuleView.self) { r, viewController in
            viewController.output = r.resolve(SearchModulePresenter.self, argument: viewController)
        }
    }
}
