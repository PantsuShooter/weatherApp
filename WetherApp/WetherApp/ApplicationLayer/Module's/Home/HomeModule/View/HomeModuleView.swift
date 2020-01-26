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
    
    var dayInfoController: DayInfoModuleView?
    var nextDaysInformationController: NextDaysInformationModuleView?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dayInfoController = segue.destination as? DayInfoModuleView {
            self.dayInfoController = dayInfoController
        }
        if let nextDaysInformationController = segue.destination as? NextDaysInformationModuleView {
            self.nextDaysInformationController = nextDaysInformationController
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        output.startGettingCoordinates()
    }
}

extension HomeModuleView: HomeModuleViewInput {

    func weatherWatsUpdatetWith(indications: WeatherIndicationsModel) {
        debugPrint("\n !weatherWatsUpdatetWith \(indications)!")
    }
}
