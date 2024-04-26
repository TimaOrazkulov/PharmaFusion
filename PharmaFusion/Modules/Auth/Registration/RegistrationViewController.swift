//
//  RegistrationViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.04.2024.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    private lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        [
            nameTextField,
            surnameTextField,
            phoneTextField,
            genderTextField,
            passwordTextField,
            actionButton,
            textButton
        ].forEach { stackView.addArrangedSubview($0) }
        stackView.setCustomSpacing(48, after: passwordTextField)
        return stackView
    }()
    
    private lazy var nameTextField = {
        let textField = RegistrationTextField()
        textField.placeholder = "Name"
        textField.keyboardType = .alphabet
        textField.delegate = self
        return textField
    }()
    
    private lazy var surnameTextField = {
        let textField = RegistrationTextField()
        textField.placeholder = "Surname"
        textField.keyboardType = .alphabet
        textField.delegate = self
        return textField
    }()
    
    private lazy var phoneTextField = {
        let textField = RegistrationTextField()
        textField.placeholder = "Phone"
        textField.keyboardType = .phonePad
        textField.delegate = self
        return textField
    }()
    
    private let genders = ["Man", "Woman"]
    
    private lazy var genderPickerView = {
        let view = UIPickerView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var genderTextField = {
        let textField = RegistrationTextField()
        textField.placeholder = "Gender"
        textField.inputView = genderPickerView
        textField.delegate = self
        return textField
    }()

    private lazy var passwordTextField = {
        let textField = RegistrationTextField()
        textField.placeholder = "Password"
        textField.keyboardType = .asciiCapable
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    private lazy var actionButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionButtonDidTap), for: .touchUpInside)
        button.backgroundColor = .init(hex: "543BD6")
        button.setTitle("Registration", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 24
        return button
    }()
    
    private lazy var textButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(textButtonDidTap), for: .touchUpInside)
        button.setTitle("Already have account?", for: .normal)
        button.setTitleColor(.init(hex: "543BD6"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 24
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
    private func textButtonDidTap() {
        // TODO: - add transition to login
    }
    
    @objc
    private func actionButtonDidTap() {
        let viewController = CategoriesViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Registration"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        textButton.snp.makeConstraints { make in
            make.height.equalTo(28)
        }
    }
    
    private func checkActionButtonState() {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let gender = genderTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if !name.isEmpty, !surname.isEmpty, !phone.isEmpty, !gender.isEmpty, !password.isEmpty {
            actionButton.isEnabled = true
            actionButton.alpha = 1
        } else {
            actionButton.isEnabled = false
            actionButton.alpha = 0.5
        }
    }
}

extension RegistrationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row]
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        checkActionButtonState()
        return true
    }
}
