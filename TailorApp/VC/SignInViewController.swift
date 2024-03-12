//
//  SignInViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    var forgetPasswordButton = UIButton(type: .system)
    var registerHereButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        setupViews()
        AutoLayout()
    }
    
    func setUpUI() {
        // Set up text fields
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        // Set up forget password button
        forgetPasswordButton.setTitle("Forget password?", for: .normal)
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordButtonTapped), for: .touchUpInside)
        
        // Set up register here button
        registerHereButton.setTitle("Don't have an account? Register here", for: .normal)
        registerHereButton.addTarget(self, action: #selector(registerHereButtonTapped), for: .touchUpInside)
    }
    
    func setupViews() {
        // Add subviews
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgetPasswordButton)
        view.addSubview(registerHereButton)
    }
    
    func AutoLayout() {
        usernameTextField.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
                make.leading.equalToSuperview().offset(50)
                make.trailing.equalToSuperview().offset(-50)
                make.height.equalTo(50)
            }
            
            // Password Text Field
            passwordTextField.snp.makeConstraints { make in
                make.top.equalTo(usernameTextField.snp.bottom).offset(20)
                make.leading.trailing.height.equalTo(usernameTextField)
            }
            
            // Forget Password Button
            forgetPasswordButton.snp.makeConstraints { make in
                make.top.equalTo(passwordTextField.snp.bottom).offset(10)
                make.leading.equalToSuperview().offset(50)
                make.trailing.equalToSuperview().offset(-50)
            }
            
            // Register Here Button
            registerHereButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            }
    }
    
    @objc func forgetPasswordButtonTapped() {
        // Handle forget password functionality
    }
    
    @objc func registerHereButtonTapped() {
        // Handle register here functionality
    }
}
