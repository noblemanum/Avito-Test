//
//  AdBoosterHeader.swift
//  Avito Test
//
//  Created by Dimon on 06.01.2021.
//

import UIKit

final class AdBoosterHeader: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    // MARK: - Private
    
    private enum Constants {
        static let edgeInset: CGFloat = 16.0
    }
    
    private func configure() {
        backgroundColor = .clear
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.edgeInset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.edgeInset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.edgeInset).withPriority(999),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.edgeInset).withPriority(999),
        ])
    }
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: 26.0, weight: .bold)
        result.numberOfLines = 0
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
}
