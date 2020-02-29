//
//  DayInfoCell.swift
//  WetherApp
//
//  Created by Home on 07.02.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class DayInfoCell: UICollectionViewCell {
    
    struct Const {
         static let kelvin: Double = 273.15
     }
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var weatherAnimationView: AnimationView!
    @IBOutlet private weak var temperatureLabel: UILabel!

    @IBOutlet weak var weatherAnimationViewHightConstraint: NSLayoutConstraint!
    @IBOutlet weak var weatherAnimationViewWidthConstraint: NSLayoutConstraint!
    
    public func setupCellWith(model: WeatherListModel) {
        
        setupTimeLabelWith(interval: TimeInterval(model.deltaTiming))
        
        temperatureLabel.text = "\(Int(model.main.tempMax - Const.kelvin))°"
        


        guard let type = WeatheIconName(rawValue: model.weather[0].icon) else { return }
        setWeatherAnimationBy(type: type)
    }
    
    private func setupTimeLabelWith(interval: TimeInterval) {
      
        let date = Date(timeIntervalSince1970: interval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        timeLabel.text = dateFormatter.string(from: date)
    }
    
    private func setWeatherAnimationBy(type: WeatheIconName) {
        
        let animation = Animation.named(type.animationLotiJsonName)
        weatherAnimationView.animation = animation
        weatherAnimationView.loopMode = .loop
        weatherAnimationView.backgroundBehavior = .pauseAndRestore
        weatherAnimationView.play()
    }
}
