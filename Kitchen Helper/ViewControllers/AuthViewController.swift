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
        field.backgroundColor = .clear
        return field
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registration", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .lightGray
        
        [emailTextField, passwordTextField, loginButton, registerButton].forEach {
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            view.addSubview($0)
        }
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(regAction), for: .touchUpInside)

        
        emailTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-80)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(registerButton.snp.top).offset(-10)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
        }
    }
    
    @objc func loginAction () {
        let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate
        
        let tabBarController = TabBarController()
        
        sceneDelegate?.window?.rootViewController = tabBarController
        UIView.transition(with: sceneDelegate!.window!,
                          duration: 0.4,
                          options: .transitionFlipFromRight,
                          animations: nil,
                          completion: nil)
    }
    
    @objc func regAction() {
        let nextController = RegistrationController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}
