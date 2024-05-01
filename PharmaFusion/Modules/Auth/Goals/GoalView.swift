//
//  GoalView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import UIKit
import Kingfisher

final class GoalView: UIControl {
    
    override var isSelected: Bool {
        didSet {
            guard oldValue != isSelected else {
                return
            }
            
            alpha = isSelected ? 1 : 0.5
        }
    }
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .init(hex: "#543BD6")
        label.text = goal.title
        return label
    }()
    
    private lazy var imageView = UIImageView()
    
    let goal: Goal
    
    init(goal: Goal) {
        self.goal = goal
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        alpha = 0.5
        backgroundColor = .init(hex: "#D9D9F4")
        layer.cornerRadius = 16
        imageView.kf.setImage(with: goal.image)
        [titleLabel, imageView].forEach { addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.bottom.equalToSuperview().inset(20)
            make.trailing.equalTo(imageView.snp.leading).offset(-12)
        }
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-12)
            make.width.equalTo(80)
        }
    }
}
