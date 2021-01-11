//
//  UIImageView+Avito.swift
//  Avito Test
//
//  Created by Dimon on 07.01.2021.
//

import UIKit

extension UIImageView {
    
    func setImage(with url: URL) {
        let task = URLSession.shared.dataTask(with: url) {
            data, response, _ in

            guard let data = data,
                  let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async() {
                [weak self] in
                
                self?.image = image
            }
        }
        
        task.resume()
    }
}
