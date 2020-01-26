//
//  WeatherInfoModel.swift
//  WetherApp
//
//  Created by Home on 26.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class WeatherInfoModel: Decodable {

    let id: Int
    let main: String
    let description: String
    let icon: String
    
    required init(id: Int, main: String, description:String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}
