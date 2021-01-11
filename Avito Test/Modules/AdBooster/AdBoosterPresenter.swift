//
//  AdBoosterPresenter.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import Foundation

protocol AdBoosterModuleInput: AnyObject {
}

protocol AdBoosterModuleOutput: AnyObject {
}

final class AdBoosterPresenter: AdBoosterModuleInput, AdBoosterViewOutput, AdBoosterInteractorOutput {
    
    weak var view: AdBoosterViewInput!
    var interactor: AdBoosterInteractor!
    var router: AdBoosterRouter!
    weak var output: AdBoosterModuleOutput?
    
    // MARK: - Input
    
    // MARK: - AdBoosterViewOutput
    
    func viewDidLoad() {
        interactor.loadData()
    }

    func didSelectItem(at indexPath: IndexPath) {
        let index = indexPath.item

        guard let list = result?.list, list.indices.contains(index) else {
            return
        }

        let item = list[index]
        selectedId = selectedId != item.id ? item.id : ""
        updateViewData()
    }

    func didConfirmSelection() {
        if let selectedItem = result?.list.first(where: { $0.id == selectedId }) {
            view.showMessage(selectedItem.title)
        } else {
            view.showMessage(NSLocalizedString("adBooster.noSelection", comment: ""))
        }
    }
    
    // MARK: - AdBoosterInteractorOutput
    
    func didLoadData(_ result: AdBoosterResponse) {
        self.result = result
        updateViewData()
    }
    
    func didGetError(_ error: ProviderError) {
        view.showMessage(error.errorDescription ?? NSLocalizedString("error.unknown", comment: ""))
    }
    
    // MARK: - Private

    private var result: AdBoosterResponse?
    private var selectedId = ""

    private func updateViewData() {
        guard let result = result else {
            return
        }

        let data = AdBoosterData(result: result, selectedId: selectedId)
        view.reload(with: data)

        let title = selectedId.isEmpty ? result.actionTitle : result.selectedActionTitle
        view.setButtonTitle(title)
    }
}

private extension AdBoosterData {

    init(result: AdBoosterResponse, selectedId: String) {
        self.title = result.title
        self.items = result.list.map { .init(item: $0, isSelected: $0.id == selectedId) }
    }
}

private extension AdBoosterCell.ViewModel {

    init(item: AdBooster, isSelected: Bool) {
        self.imageURL = item.icon.url
        self.title = item.title
        self.description = item.description ?? ""
        self.price = item.price
        self.isSelected = isSelected
    }
}
