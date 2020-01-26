//
//  ApplicationAssembly.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
    
    // Use default dependency
    class var assembler: Assembler {
        return Assembler([
            TabBarAssemblyContainer(),
            HomeAssemblyContainer(),
            DayInfoAssemblyContainer(),
            NextDaysInformationAssemblyContainer(),
            MapAssemblyContainer(),
            SearchAssemblyContainer()
        ])
    }
    
    var assembler: Assembler
    
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
}

// Inject dependency in Main Storyboard
extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
        Container.loggingFunction = nil
    }
}
