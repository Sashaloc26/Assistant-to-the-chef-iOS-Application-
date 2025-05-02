//
//  RegistrationViewControlller.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 01/05/2025.
//

import Foundation
import UIKit


class RegistrationController: BaseViewController {
    
    let mainNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = Fonts.montserratFont(with: 30, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
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
        
        [emailTextField, passwordTextField, registerButton].forEach {
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            view.addSubview($0)
        }
        view.addSubview(mainNameLabel)
        
        registerButton.addTarget(self, action: #selector(regAction), for: .touchUpInside)

        
        emailTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        mainNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
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
        
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
        }
    }
    
    @objc func regAction() {

    }

}
