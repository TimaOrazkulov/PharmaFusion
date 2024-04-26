//
//  CategoryCell.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import UIKit

protocol CategoryCellDelegate: AnyObject {
    func didSelectCategory(_ cell: CategoryCell)
}

final class CategoryCell: UICollectionViewCell {
    private lazy var categoryView = CategoryView()
    
    weak var delegate: CategoryCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category) {
        categoryView.configure(with: category)
    }
    
    @objc
    private func categoryViewDidTap() {
        delegate?.didSelectCategory(self)
    }
    
    private func setup() {
        backgroundColor = .clear
        contentView.addSubview(categoryView)
        categoryView.addTarget(self, action: #selector(categoryViewDidTap), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        categoryView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
