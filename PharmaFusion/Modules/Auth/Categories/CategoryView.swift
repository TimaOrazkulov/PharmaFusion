//
//  CategoryView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import Kingfisher
import UIKit

final class CategoryView: UIControl {
    override var isSelected: Bool {
        didSet {
            guard isSelected != oldValue else {
                return
            }
            
            alpha = isSelected ? 1 : 0.5
        }
    }
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category) {
        titleLabel.text = category.title
        imageView.image = category.image
        isSelected = category.isSelected
    }
    
    private func setup() {
        alpha = 0.5
        backgroundColor = .init(hex: "#B4B3E8")
        layer.cornerRadius = 16
        [imageView, titleLabel].forEach { addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(titleLabel.snp.top).offset(-8)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(12)
        }
    }
}
