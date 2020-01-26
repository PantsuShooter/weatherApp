//
//  NetworkManager.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import Alamofire

struct APPURL {
            
    static var appid = "5b073352cb46ecdfa6e90b36790fb919"

    private struct Domains {
        static let MainDomain = "https://api.openweathermap.org/"
    }
    
    private struct Routes {
        static let Api = "data/2.5/"
    }
    static let Domain  = Domains.MainDomain
    private static let Route   = Routes.Api
    private static let BaseURL = Domain + Route
        
    static var weather: String {return BaseURL + "weather"}
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    public func getWeatherBy(latitude: Double, longitude: Double ,completionBlock: @escaping ( _ user: WeatherIndicationsModel?,  _ error: Error?) -> ()) {
        
        let parameters = ["lat" : latitude,
                          "lon" : longitude,
                          "appid" : APPURL.appid] as [String : Any]

        let headers = ["Content-Type": "application/x-www-form-urlencoded"]
        
        Alamofire.request(APPURL.weather, method: .get, parameters: parameters, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data, let weather = try? JSONDecoder().decode(WeatherIndicationsModel.self, from: data) {
                    completionBlock(weather,nil)
                } else {
                    let error = NSError.init(domain: response.result.debugDescription, code: 404, userInfo: nil)
                    completionBlock(nil, error)
                }
                debugPrint(response)
            case .failure(let error):
                if let error = error as NSError? {
                    debugPrint(error)
                }
            }
        }
    }
}
