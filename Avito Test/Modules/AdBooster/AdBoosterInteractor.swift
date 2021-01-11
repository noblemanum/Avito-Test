//
//  AdBoosterInteractor.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import Foundation

protocol AdBoosterInteractorInput {
    func loadData()
}

protocol AdBoosterInteractorOutput: AnyObject {
    func didLoadData(_ result: AdBoosterResponse)
    func didGetError(_ error: ProviderError)
}

final class AdBoosterInteractor: AdBoosterInteractorInput {
    
    weak var output: AdBoosterInteractorOutput?
    var provider: AdBoosterProvider?
    
    func loadData() {
        provider?.fetchLocalData(completion: {
            result in
            
            switch result {
            case .success(let result):
                self.output?.didLoadData(result)
            case .failure(let error):
                self.output?.didGetError(error)
            }
        })
    }
}
