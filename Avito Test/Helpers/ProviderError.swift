//
//  ProviderError.swift
//  Avito Test
//
//  Created by Dimon on 05.01.2021.
//

import Foundation

enum ProviderError: LocalizedError {
    
    case decodeError
    case readingError

    var errorDescription: String? {
        switch self {
        case .decodeError:
            return "Decode error"
        case .readingError:
            return "Reading error"
        }
    }
}
