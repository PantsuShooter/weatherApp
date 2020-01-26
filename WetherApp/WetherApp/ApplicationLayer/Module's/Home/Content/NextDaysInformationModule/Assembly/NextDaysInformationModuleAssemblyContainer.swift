//
//  NextDaysInformationModuleAssemblyContainer.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class NextDaysInformationAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(NextDaysInformationModuleInteractor.self) { (r, presenter: NextDaysInformationModulePresenter) in
            let interactor = NextDaysInformationModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(NextDaysInformationModuleRouter.self) { (r, viewController: NextDaysInformationModuleView) in
            let router = NextDaysInformationModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(NextDaysInformationModulePresenter.self) { (r, viewController: NextDaysInformationModuleView) in
            let presenter = NextDaysInformationModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(NextDaysInformationModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(NextDaysInformationModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(NextDaysInformationModuleView.self) { r, viewController in
            viewController.output = r.resolve(NextDaysInformationModulePresenter.self, argument: viewController)
        }
    }
}
