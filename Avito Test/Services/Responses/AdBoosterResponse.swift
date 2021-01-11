//
//  AvitoResult.swift
//  Avito Test
//
//  Created by Dimon on 05.01.2021.
//

import Foundation

struct AdBoosterResponse: Decodable {
    let title: String
    let actionTitle: String
    let selectedActionTitle: String
    let list: [AdBooster]
}
