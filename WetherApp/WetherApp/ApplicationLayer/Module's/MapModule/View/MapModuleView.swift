//
//  MapModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class MapModuleView: UIViewController {
    
    var output: MapModuleViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension MapModuleView: MapModuleViewInput {}
