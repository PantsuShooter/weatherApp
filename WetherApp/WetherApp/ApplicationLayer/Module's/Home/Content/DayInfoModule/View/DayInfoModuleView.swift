//
//  DayInfoModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import Lottie


class DayInfoModuleView: UIViewController {
    
    struct Const {
        static let kelvin: Double = 273.15
        
        struct NibName {
            static let dayInfoCell = "DayInfoCell"
        }
        
        struct Id {
            static let dayInfoCellID = "dayInfoCellID"
        }
    }
    
    var output: DayInfoModuleViewOutput!
    
    @IBOutlet weak var dayTimeCollectionView: UICollectionView!
    
    @IBOutlet weak var currentInformationView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentWeatherAnimationView: AnimationView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var hygrometerLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

//MARK:- Setup
extension DayInfoModuleView {
    
    private func setupUI() {
        
        setupDate()
        updateWeatherViews()
        registerCell()
    }
    
    private func setupDate() {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMMM"
        dateLabel.text = dateFormatter.string(from: date)
    }
    
    private func registerCell() {
        
        dayTimeCollectionView.register(UINib(nibName: Const.NibName.dayInfoCell, bundle: .main), forCellWithReuseIdentifier: Const.Id.dayInfoCellID)
        
    }
}

//MARK:- Private
extension DayInfoModuleView {
    
    private func updateWeatherViews() {
        
        guard let weather = output.getCurrentWeather() else { return }
        
        cityNameLabel.text = weather.name
        temperatureLabel.text = "\(Int(weather.main.tempMax - Const.kelvin))°/\(Int(weather.main.tempMin - Const.kelvin))°"
        hygrometerLabel.text = "\(weather.main.humidity)%"
        windLabel.text = "\(Int(weather.wind.speed))m/sec"
        arrowImageView.rotate(angle: CGFloat(weather.wind.deg))
        guard let type = WeatheIconName(rawValue: weather.weather[0].icon) else { return }
        setWeatherAnimationBy(type: type)
    }
    
    private func setWeatherAnimationBy(type: WeatheIconName) {
        
        let animation = Animation.named(type.animationLotiJsonName)
        currentWeatherAnimationView.animation = animation
        currentWeatherAnimationView.loopMode = .loop
        currentWeatherAnimationView.backgroundBehavior = .pauseAndRestore
        currentWeatherAnimationView.play()
    }
}

//MARK:-  Actions
extension DayInfoModuleView {

    @IBAction func locationButton(_ sender: Any) {
        
    }
}

//MARK:- UICollectionViewDataSource
extension DayInfoModuleView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.getHourlyWeatherCount()
    }
}

//MARK:- UICollectionViewDelegate
extension DayInfoModuleView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = dayTimeCollectionView.dequeueReusableCell(withReuseIdentifier: Const.Id.dayInfoCellID, for: indexPath) as? DayInfoCell else { return UICollectionViewCell() }
        
        guard let model = output.getHourlyWeatherAt(index: indexPath.row) else { return UICollectionViewCell() }
        
        
        cell.weatherAnimationViewHightConstraint.constant = collectionView.frame.height * 0.55
        cell.weatherAnimationViewWidthConstraint.constant = cell.frame.width
        
        cell.setupCellWith(model: model)
        
        return cell
    }
}


extension DayInfoModuleView: DayInfoModuleViewInput {
    
    func hourlyWeatherWasUpdated() {
        dayTimeCollectionView.reloadData()
    }
    
    func weatherWasUpdated() {
        
        updateWeatherViews()
    }
}
