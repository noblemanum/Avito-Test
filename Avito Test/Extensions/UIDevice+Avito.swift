//
//  UIDevice+Avito.swift
//  Avito Test
//
//  Created by Dimon on 06.01.2021.
//

import UIKit

extension UIDevice {
    
    var isSmall: Bool {
        return UIScreen.main.fixedCoordinateSpace.bounds.width < 375.0
    }
}
