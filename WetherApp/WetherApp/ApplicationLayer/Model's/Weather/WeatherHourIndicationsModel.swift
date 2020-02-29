//
//  WeatherHourIndicationsModel.swift
//  WetherApp
//
//  Created by Home on 22.02.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class WeatherHourIndicationsModel: Decodable {
    
    let cod: String
    let message: Float
    let count: Int
    let weatherList: [WeatherListModel]

    private enum CodingKeys: String, CodingKey {
              
        case cod
        case message
        case count = "cnt"
        case weatherList = "list"
    }
}
