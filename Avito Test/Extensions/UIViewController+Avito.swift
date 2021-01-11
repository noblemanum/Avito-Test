//
//  UIViewController+Avito.swift
//  Avito Test
//
//  Created by Dimon on 08.01.2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        present(alert, animated: true)
    }
}
