//
//  RegistrationTextField.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.04.2024.
//

import UIKit

final class RegistrationTextField: UITextField {
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width, height: 56)
    }
    
    override var placeholder: String? {
        didSet {
            guard oldValue != placeholder, let placeholder else {
                return
            }
            
            let attributedString = NSAttributedString(
                string: placeholder,
                attributes: [
                    .foregroundColor: UIColor.gray,
                    .font: UIFont.systemFont(ofSize: 15)
                ]
            )
            attributedPlaceholder = attributedString
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        delegate = self
        backgroundColor = .white
        tintColor = .black
        textColor = .black
        layer.cornerRadius = 12
        font = .systemFont(ofSize: 16)
    }
}

extension RegistrationTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
