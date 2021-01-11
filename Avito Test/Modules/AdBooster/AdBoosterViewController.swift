//
//  AdBoosterViewController.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import UIKit

protocol AdBoosterViewInput: AnyObject {
    func reload(with data: AdBoosterData)
    func setButtonTitle(_ title: String)
    func showMessage(_ message: String)
}

protocol AdBoosterViewOutput: AnyObject {
    func viewDidLoad()
    func didSelectItem(at indexPath: IndexPath)
    func didConfirmSelection()
}

final class AdBoosterViewController: UIViewController, AdBoosterViewInput {

    var output: AdBoosterViewOutput!
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .primaryBackground
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .plain, target: nil, action: nil)
        
        view.addSubview(collectionView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16.0),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16.0),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).withPriority(.defaultHigh),
            button.heightAnchor.constraint(equalToConstant: 50.0),
        ])
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let itemWidth = view.bounds.width - 2 * Constants.edgeInset
        collectionLayout.estimatedItemSize = CGSize(width: itemWidth, height: 350)
    }
    
    // MARK: - Input
    
    func reload(with data: AdBoosterData) {
        self.data = data
        collectionView.reloadData()
    }

    func setButtonTitle(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func showMessage(_ message: String) {
        showAlert(with: message)
    }
    
    // MARK: - Private
    
    private enum Constants {
        static let edgeInset: CGFloat = 16.0
        static let spacing: CGFloat = 10.0
        static let cornerRadius: CGFloat = 5.0
    }

    private var data = AdBoosterData.empty
    
    @objc private func confirmBoosterSelection() {
        output.didConfirmSelection()
    }
    
    // MARK: - UI
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(value: Constants.edgeInset)
        layout.minimumLineSpacing = Constants.spacing
        layout.scrollDirection = .vertical
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let result = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        result.registerHeader(for: AdBoosterHeader.self)
        result.registerCell(for: AdBoosterCell.self)
        result.backgroundColor = .clear
        result.translatesAutoresizingMaskIntoConstraints = false
        result.delegate = self
        result.dataSource = self
        
        return result
    }()
    
    private lazy var button: Button = {
        let result = Button()
        result.titleLabel?.font = .systemFont(ofSize: 16.0)
        result.backgroundColor = .buttonBackground
        result.setTitleColor(.buttonTint, for: .normal)
        result.layer.cornerRadius = Constants.cornerRadius
        result.addTarget(self, action: #selector(confirmBoosterSelection), for: .touchUpInside)
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
}

extension AdBoosterViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.didSelectItem(at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView,
                                             viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
                                             at: indexPath)

        let size = CGSize(width: collectionView.bounds.width, height: UIView.layoutFittingExpandedSize.height)

        return headerView.systemLayoutSizeFitting(size,
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
    }
}

extension AdBoosterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: AdBoosterCell.self, for: indexPath) as! AdBoosterCell
        cell.fill(with: data.items[indexPath.item])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueHeader(for: AdBoosterHeader.self, for: indexPath) as! AdBoosterHeader
        header.title = data.title
        
        return header
    }
}
