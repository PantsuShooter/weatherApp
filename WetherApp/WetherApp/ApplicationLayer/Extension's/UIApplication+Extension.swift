//
//  UIApplication+Extension.swift
//  WetherApp
//
//  Created by Home on 22.02.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
