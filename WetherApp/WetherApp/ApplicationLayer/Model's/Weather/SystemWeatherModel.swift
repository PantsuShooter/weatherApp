//
//  SystemWeatherModel.swift
//  WetherApp
//
//  Created by Home on 26.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class SystemWeatherModel: Decodable {
    
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
    let pod: String?


    required init(type: Int?, id: Int?, message: Double?, country: String?, sunrise: Int?, sunset: Int?, pod: String?) {
        
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
        self.pod = pod
    }
}
