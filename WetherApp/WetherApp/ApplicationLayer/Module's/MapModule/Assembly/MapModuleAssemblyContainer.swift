//
//  MapModuleAssemblyContainer.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class MapAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(MapModuleInteractor.self) { (r, presenter: MapModulePresenter) in
            let interactor = MapModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(MapModuleRouter.self) { (r, viewController: MapModuleView) in
            let router = MapModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(MapModulePresenter.self) { (r, viewController: MapModuleView) in
            let presenter = MapModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(MapModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(MapModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(MapModuleView.self) { r, viewController in
            viewController.output = r.resolve(MapModulePresenter.self, argument: viewController)
        }
    }
}
