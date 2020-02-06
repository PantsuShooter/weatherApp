//
//  UIView+Extension.swift
//  WetherApp
//
//  Created by Home on 06.02.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

extension UIView {

    /**
     Rotate a view by specified degrees

     - parameter angle: angle in degrees
     */
    func rotate(angle angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}
