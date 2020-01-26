//
//  WindWeatherModel.swift
//  WetherApp
//
//  Created by Home on 26.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class WindWeatherModel: Decodable {
    
    let speed: Double
    let deg: Double
    
    required init(speed: Double, deg: Double) {
           self.speed = speed
           self.deg = deg
    }
}
