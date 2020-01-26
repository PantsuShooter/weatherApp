//
//  CloudsWeatherModel.swift
//  WetherApp
//
//  Created by Home on 26.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class CloudsWeatherModel: Decodable {
    
    let all: Int

    required init(all: Int) {
        self.all = all
    }
}
