//
//  SearchModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class SearchModuleView: UIViewController {
    
    var output: SearchModuleViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SearchModuleView: SearchModuleViewInput {}
