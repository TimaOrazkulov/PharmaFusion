//
//  GoalsViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import UIKit

final class GoalsViewController: UIViewController {
    
    private let goals: [Goal] = [
        .init(title: "Medications monitoring", image: URL(fileURLWithPath: "")),
        .init(title: "Order medications", image: URL(fileURLWithPath: "")),
        .init(title: "Maintain a women's calendar", image: URL(fileURLWithPath: ""))
    ]
    
    private var selectedGoalView: GoalView? {
        didSet {
            guard oldValue != selectedGoalView else {
                return
            }
            
            oldValue?.isSelected = false
            selectedGoalView?.isSelected = true
        }
    }
    
    private lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        goals.map { goal in
            let goalView = GoalView(goal: goal)
            goalView.addTarget(self, action: #selector(goalDidTap), for: .touchUpInside)
            return goalView
        }.forEach { goalView in
            stackView.addArrangedSubview(goalView)
        }
        return stackView
    }()
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Time to decide?"
        return label
    }()
    
    private lazy var subtitleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Choose your goal."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var actionButton = {
        let button = UIButton()
        button.backgroundColor = .init(hex: "#543BD6")
        button.layer.cornerRadius = 20
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(actionButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar(isHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        configureNavigationBar(isHidden: false)
    }
    
    @objc
    private func goalDidTap(_ sender: GoalView) {
        selectedGoalView = sender
    }
    
    @objc
    private func actionButtonDidTap() {
        // TODO: - add transition to goal screen
    }
    
    private func configureNavigationBar(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
    
    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        [titleLabel, subtitleLabel, stackView, actionButton].forEach { view.addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        actionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.size.equalTo(
                CGSize(width: 178, height: 40)
            )
        }
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
        }
    }
}
