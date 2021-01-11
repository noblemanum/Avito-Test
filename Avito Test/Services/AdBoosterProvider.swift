//
//  AdBoosterProvider.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import Foundation

protocol AdBoosterProvider {
    func fetchLocalData(completion: @escaping(Result<AdBoosterResponse, ProviderError>) -> Void)
}

final class DefaultAdBoosterProvider: AdBoosterProvider {
    
    func fetchLocalData(completion: @escaping(Result<AdBoosterResponse, ProviderError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "result", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            completion(.failure(.readingError))
            return
        }
        
        do {
            let response = try JSONDecoder().decode(StatusResponse<AdBoosterResponse>.self, from: data)
            completion(.success(response.result))
        } catch {
            completion(.failure(.decodeError))
        }
    }
}
