//
//  TabBarModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class TabBarModuleView: UITabBarController {
    
    var output: TabBarModuleViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension TabBarModuleView: TabBarModuleViewInput {}
