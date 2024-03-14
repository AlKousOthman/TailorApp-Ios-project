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
      var logoImageView = UIImageView() // Step 1: Define UIImageView property
      
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
            
            // Step 2: Set up UIImageView
            logoImageView.image = UIImage(named: "tailor5")
        }
        
        func setupViews() {
            // Add subviews
            view.addSubview(usernameTextField)
            view.addSubview(passwordTextField)
            view.addSubview(forgetPasswordButton)
            view.addSubview(registerHereButton)
            view.addSubview(signInButton)
            view.addSubview(logoImageView)
        }
        
    
//    func AutoLayout() {
//          
//          usernameTextField.snp.makeConstraints { make in
//              make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
//              make.leading.equalToSuperview().offset(50)
//              make.trailing.equalToSuperview().offset(-50)
//              make.height.equalTo(50)
//          }
//          
//        
//          passwordTextField.snp.makeConstraints { make in
//              make.top.equalTo(usernameTextField.snp.bottom).offset(20)
//              make.leading.trailing.height.equalTo(usernameTextField)
//          }
//          
//     
//          signInButton.snp.makeConstraints { make in
//              make.top.equalTo(passwordTextField.snp.bottom).offset(20)
//              make.leading.trailing.height.equalTo(usernameTextField)
//          }
//          
//          
//          forgetPasswordButton.snp.makeConstraints { make in
//              make.top.equalTo(signInButton.snp.bottom).offset(10)
//              make.leading.equalToSuperview().offset(50)
//              make.trailing.equalToSuperview().offset(-50)
//          }
//          
//          
//          registerHereButton.snp.makeConstraints { make in
//              make.centerX.equalToSuperview()
//              make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
//          }
//          
//          
//          logoImageView.snp.makeConstraints { make in
//              make.centerX.equalToSuperview()
//              make.bottom.equalTo(usernameTextField.snp.top).offset(-10)
//              make.width.equalTo(300)
//              make.height.equalTo(200)
//          }
//    
//      }
    func AutoLayout() {
        usernameTextField.snp.makeConstraints { make in
           // make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
                 make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.top.equalTo(logoImageView.snp.bottom).offset(20)      
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(usernameTextField)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(usernameTextField)
        }
        
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        registerHereButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }

    @objc func forgetPasswordButtonTapped() {
        
    }
    
    @objc func registerHereButtonTapped() {
        let registerVC = SignUpViewController()
        registerVC.modalPresentationStyle = .fullScreen
       navigationController?.pushViewController(registerVC, animated: true)
   

       // tapView.modalPresentationStyle = .fullScreen
       // self.present(tapView, animated: true)
    }
    
    @objc func signInButtonTapped() {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        NetworkManager.shared.signIn(username: username , password:password ) {
            success in
                        DispatchQueue.main.async {
                            switch success {
                            case .success(let tokenResponse):
                                print("Sign In successful. Token: \(tokenResponse.token)")
                                                            
                                let homeVC = HomeViewController()
                                homeVC.modalPresentationStyle = .fullScreen
                                self.navigationController?.pushViewController(homeVC, animated: true)
                               
                                let tapView = MainTabBarController()
                                //you may need to pass some data
                                self.navigationController?.pushViewController(tapView, animated: true)
                                
                            case .failure(let error):
                                print("Sign In failed. Error: \(error.localizedDescription)")
                                
                            }
                        }
        }
        
        

    }
    
}

// use switch func if case success enter thus func  let tapView = MainTabBarController()
//you may need to pass some data
//navigationController?.pushViewController(tapView, animated: true)
