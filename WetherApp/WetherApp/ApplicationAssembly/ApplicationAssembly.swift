//
//  ApplicationAssembly.swift
//  FreeStuffFinder
//
//  Created by MacBook on 24.09.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
    
    // Use default dependency
    class var assembler: Assembler {
        return Assembler([])
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
