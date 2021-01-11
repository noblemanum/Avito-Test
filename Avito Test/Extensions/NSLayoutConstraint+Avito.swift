//
//  NSLayoutConstraint+Avito.swift
//  Avito Test
//
//  Created by Dimon on 07.01.2021.
//

import UIKit

extension NSLayoutConstraint {
    
    func withPriority(_ value: Float) -> NSLayoutConstraint {
        self.priority = UILayoutPriority(rawValue: value)
        return self
    }
    
    func withPriority(_ value: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = value
        return self
    }
}
