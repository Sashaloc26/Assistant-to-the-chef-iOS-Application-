//
//  AuthViewController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 30/04/2025.
//

import Foundation
import UIKit
import SnapKit


class AuthViewController: BaseViewController {
    var emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.textContentType = .emailAddress
        field.borderStyle = .line
        field.backgroundColor = .clear
        return field
    }()
    
    var passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.textContentType = .password
        field.borderStyle = .line
        field.backgroundColor = .clear
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        makeConstraints()
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .gray
        
        [emailTextField, passwordTextField].forEach {
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.backgroundColor = .white
            view.addSubview($0)
        }
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)

        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
}
