//
//  GoalsViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import UIKit

final class GoalsViewController: UIViewController {
    
    private lazy var stackView = UIStackView()
    
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
        
        configureNavigationBar()
    }
    
    @objc
    private func actionButtonDidTap() {
        // TODO: - add transition to goal screen
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Choose your goal"
    }
    
    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        
    }
}
