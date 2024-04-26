//
//  AuthIntroViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 15.03.2024.
//

import UIKit

final class AuthIntroViewController: UIViewController {
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.text = "Authorization"
        
        return label
    }()
    
    private lazy var descriptionLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.text = "Create an account in the application so that you can use the functionality to the fullest."
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var imageView = UIImageView(image: UIImage(named: "AuthIntro"))
    
    private lazy var registrationButton = {
        let button = UIButton()
        button.setTitle("Registration", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.backgroundColor = .init(hex: "#6562CE")
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 18
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = AuthStepsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(imageView)
        view.addSubview(registrationButton)
        setupConstraints()
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.equalToSuperview().offset(24)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-32)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualTo(registrationButton.snp.bottom).offset(-24)
        }
        registrationButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(36)
        }
    }
}
