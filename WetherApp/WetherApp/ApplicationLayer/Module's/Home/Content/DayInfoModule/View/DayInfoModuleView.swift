//
//  DayInfoModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class DayInfoModuleView: UIViewController {
    
    var output: DayInfoModuleViewOutput!
    
    @IBOutlet weak var currentInformationView: UIView!
    @IBOutlet weak var dayTimeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DayInfoModuleView {
    
    private func setupUI() {
        
    }
    
}

extension DayInfoModuleView: DayInfoModuleViewInput {
    func weatherWasUpdated() {
        
    }
}
