//
//  UICollectionView+Avito.swift
//  Avito Test
//
//  Created by Dimon on 06.01.2021.
//

import UIKit

extension UICollectionView {
    
    func registerCell(for cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueCell(for cellClass: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath)
    }
    
    func registerHeader(for viewClass: AnyClass) {
        register(
            viewClass,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: viewClass)
        )
    }
    
    func dequeueHeader(for viewClass: AnyClass, for indexPath: IndexPath) -> UICollectionReusableView {
        dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: viewClass),
            for: indexPath
        )
    }
}
