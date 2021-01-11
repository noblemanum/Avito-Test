//
//  AdBoosterResponse.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import Foundation

struct AdBooster: Decodable {
    let id: String
    let title: String
    let description: String?
    let icon: Icon
    let price: String
    
    struct Icon: Decodable {
        let url: URL
        
        enum CodingKeys: String, CodingKey {
            case url = "52x52"
        }
    }
}
