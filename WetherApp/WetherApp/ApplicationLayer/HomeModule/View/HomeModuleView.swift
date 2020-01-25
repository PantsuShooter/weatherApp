//
//  HomeModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class HomeModuleView: UIViewController {
    
    var output: HomeModuleViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomeModuleView: HomeModuleViewInput {}
