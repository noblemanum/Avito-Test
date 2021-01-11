//
//  ResultsResponse.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import Foundation

struct StatusResponse<Wrapped: Decodable>: Decodable {
    let status: String
    let result: Wrapped
}
