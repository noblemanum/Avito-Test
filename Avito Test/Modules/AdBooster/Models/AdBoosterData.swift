//
//  AdBoosterData.swift
//  Avito Test
//
//  Created by Dimon on 08.01.2021.
//

import Foundation

struct AdBoosterData {
    let title: String
    let items: [AdBoosterCell.ViewModel]
}

extension AdBoosterData {

    static let empty = AdBoosterData(title: "", items: [])
}
