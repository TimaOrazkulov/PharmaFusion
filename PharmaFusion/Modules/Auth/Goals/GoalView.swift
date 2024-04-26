//
//  GoalView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import UIKit

final class GoalView: UIControl {
    
    private lazy var titleLabel = UILabel()
    private lazy var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
    
}
