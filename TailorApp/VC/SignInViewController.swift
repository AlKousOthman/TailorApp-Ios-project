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
    var signInButton = UIButton(type: .system)

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
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
        signInButton.backgroundColor = .blue
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.cornerRadius = 10
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowOpacity = 0.5
        signInButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        signInButton.layer.shadowRadius = 4
    }
    
    func setupViews() {
        // Add subviews
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgetPasswordButton)
        view.addSubview(registerHereButton)
        view.addSubview(signInButton)

    }
    
    func AutoLayout() {
        // Username Text Field
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
        
        // Sign In Button
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(usernameTextField)
        }
        
        // Forget Password Button
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
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
        
    }
    
    @objc func registerHereButtonTapped() {
//        let registerVC = HomeViewController()
//        registerVC.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(registerVC, animated: true)
        
        let tapView = MainTabBarController()
        //you may need to pass some data
        navigationController?.pushViewController(tapView, animated: true)

       // tapView.modalPresentationStyle = .fullScreen
       // self.present(tapView, animated: true)
    }
    
    @objc func signInButtonTapped() {
//        let homeVC = HomeViewController()
//        homeVC.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(homeVC, animated: true)
        //add the UITapbar to the naviga
        let tapView = MainTabBarController()
        //you may need to pass some data
        navigationController?.pushViewController(tapView, animated: true)

    }
}

// use switch func if case success enter thus func  let tapView = MainTabBarController()
//you may need to pass some data
//navigationController?.pushViewController(tapView, animated: true)
