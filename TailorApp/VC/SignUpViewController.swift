//
//  SignUpViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//
//
import UIKit
import Eureka
import SnapKit
import Kingfisher
import Alamofire


class SignUpViewController: UIViewController {
//    
//    let nameTextField = UITextField()
//    let usernameTextField = UITextField()
//    let emailTextField = UITextField()
//    let phoneTextField = UITextField()
//    let addressTextField = UITextField()
//    let passwordTextField = UITextField()
//    let confirmPasswordTextField = UITextField()
//    let registerButton = UIButton()

    enum TagUser: String {
           case username = "username"
           case email = "email"
           case password = "password"
           case phoneNumber = "Number"
           case adderss = "address"
       }
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            title = ("Sign up")
            view.backgroundColor = .white
            setupForm()
        }
        
    private func setupForm() {
        
        form +++ Section("Signup Information")
        <<< TextRow() { row in
            row.title = "Username"
            row.placeholder = "Enter username"
            row.tag = TagUser.username.rawValue
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< EmailRow() { row in
            row.title = "Email"
            row.placeholder = "Enter email"
            row.tag = TagUser.email.rawValue
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        
        <<< PasswordRow() { row in
            row.title = "Password"
            row.placeholder = "Enter password"
            row.tag = TagUser.password.rawValue
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        +++ Section()
        <<< ButtonRow() { row in
            row.title = "Sign Up"
            row.onCellSelection { cell, row in
                self.signUpAction()
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(signUpAction))
    }
        }
        
    
    @objc func registerButtonTapped() {
        let registerVC = SignUpViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}
