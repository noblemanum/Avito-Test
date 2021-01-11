//
//  AdBoosterCell.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import UIKit

final class AdBoosterCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct ViewModel {
        let imageURL: URL
        let title: String
        let description: String
        let price: String
        let isSelected: Bool
    }
    
    func fill(with viewModel: ViewModel) {
        adBoosterImageView.setImage(with: viewModel.imageURL)
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price

        descriptionLabel.text = viewModel.description
        descriptionLabel.isHidden = viewModel.description.isEmpty
        
        checkmark.isHidden = !viewModel.isSelected
    }
    
    // MARK: - Overrides
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        attributes.size = systemLayoutSizeFitting(layoutAttributes.size,
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
        return attributes
    }
    
    // MARK: - Private
    
    private enum Constants {
        static let itemSpacing: CGFloat = 16.0
        static let iconWidth: CGFloat = UIDevice.current.isSmall ? 39.0 : 52.0
    }
    
    private func configure() {
        backgroundColor = .secondaryBackground
        layer.cornerRadius = 5.0
        
        contentView.addSubview(adBoosterImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(checkmark)
        
        NSLayoutConstraint.activate([
            adBoosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.itemSpacing),
            adBoosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.itemSpacing),
            adBoosterImageView.widthAnchor.constraint(equalToConstant: Constants.iconWidth),
            adBoosterImageView.heightAnchor.constraint(equalTo: adBoosterImageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            stackView.leadingAnchor.constraint(equalTo: adBoosterImageView.trailingAnchor, constant: Constants.itemSpacing),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -52.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0),
            
            checkmark.centerYAnchor.constraint(equalTo: adBoosterImageView.centerYAnchor),
            checkmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.itemSpacing),
            checkmark.widthAnchor.constraint(equalToConstant: 20.0),
            checkmark.heightAnchor.constraint(equalTo: checkmark.widthAnchor),
        ])
    }
    
    // MARK: - UI
    
    private lazy var adBoosterImageView: UIImageView = {
        let result = UIImageView()
        result.contentMode = .scaleAspectFill
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
    
    private lazy var stackView: UIStackView = {
        let result = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, priceLabel])
        result.translatesAutoresizingMaskIntoConstraints = false
        result.alignment = .fill
        result.axis = .vertical
        result.spacing = 10.0
        
        return result
    }()
    
    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: UIDevice.current.isSmall ? 18.0 : 22.0, weight: .bold)
        result.numberOfLines = 0
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: 14.0)
        result.numberOfLines = 0
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
    
    private lazy var priceLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: 15.0, weight: .bold)
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
    
    private lazy var checkmark: UIImageView = {
        let result = UIImageView()
        result.image = #imageLiteral(resourceName: "checkmark")
        result.contentMode = .scaleAspectFill
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
}
