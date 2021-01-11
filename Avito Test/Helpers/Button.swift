//
//  Button.swift
//  Avito Test
//
//  Created by Dimon on 09.01.2021.
//

import UIKit

final class Button: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            guard isHighlighted != oldValue else {
                return
            }
            
            updateHighlighting()
        }
    }
    
    private func updateHighlighting() {
        backgroundColor = backgroundColor()
    }
    
    private func backgroundColor() -> UIColor {
        isHighlighted ? UIColor.buttonBackground.withAlphaComponent(0.4) : .buttonBackground
    }
}
