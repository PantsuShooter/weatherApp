//
//  HomeModuleView.swift
//  WetherApp
//
//  Created by Home on 25.01.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import MapKit

class HomeModuleView: UIViewController {
    
    var output: HomeModuleViewOutput!
    
    var dayInfoController: DayInfoModuleView?
    var nextDaysInformationController: NextDaysInformationModuleView?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private struct Const {
        struct CellID {
            static let cityCellId = "cityCellID"
            static let addNewCityCellId = "addNewCityCellID"
        }
    }
    
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
        
        self.collectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: Const.CellID.cityCellId)
        self.collectionView.register(AddNewCityCollectionViewCell.self, forCellWithReuseIdentifier: Const.CellID.addNewCityCellId)
        
    
        output.startGettingCoordinates()
    }
}

extension HomeModuleView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        var cell = UICollectionViewCell()
        
        if true {
            guard let addNewCityCell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.CellID.addNewCityCellId, for: indexPath as IndexPath) as? AddNewCityCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell = addNewCityCell
        } else {
            guard let cityCell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.CellID.cityCellId, for: indexPath as IndexPath) as? CityCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell = cityCell
        }
        

        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
}

extension HomeModuleView: HomeModuleViewInput {
    
    func receivedNew(coordinates: CLLocationCoordinate2D) {
        dayInfoController?.output.setUpdated(coordinates: coordinates)
        nextDaysInformationController?.output.setUpdated(coordinates: coordinates)
    }
}
