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

//
//class SignUpViewController: FormViewController {
//    
//    var token: String?
//    
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        
//        setUp()
//    }
//    
//    
//    func setUp(){
//        form +++ Section("Sign Up")
//        <<< TextRow{ row in
//            row.title = "Username"
//            row.placeholder = "Enter your username here"
//            row.tag = "Username"
//            //red color and error
//            row.add(rule: RuleRequired())
//            row.validationOptions = .validatesOnChange
//            row.cellUpdate { cell, row in
//                if !row.isValid{
//                    cell.titleLabel?.textColor = .red
//                }
//            }
//        }
//        <<< PasswordRow{ row in
//            row.title = "Password"
//            row.placeholder = "Enter your password here"
//            row.tag = "Password"
//            
//            //red color and error
//            row.add(rule: RuleRequired())
//            row.validationOptions = .validatesOnChange
//            row.cellUpdate { cell, row in
//                if !row.isValid{
//                    cell.titleLabel?.textColor = .red
//                }
//            }
//        }
//        <<< PhoneRow{ row in
//            row.title = "Phone Number"
//            row.placeholder = "Enter your Phone Number"
//            row.tag = "Phone Number"
//            row.add(rule: RuleRequired())
//            row.validationOptions = .validatesOnChange
//            row.cellUpdate { cell, row in
//                if !row.isValid{
//                    cell.titleLabel?.textColor = .red
//                }
//            }
//        }
//        +++ Section()
//        <<< ButtonRow{ row in
//            row.title = "Sign Up"
//            row.onCellSelection { cell, row in
//                self.signUp()
//            }
//        }
//    }
//    
//    @objc func signUp(){
//        let errors = form.validate()
//        guard errors.isEmpty else{
//            presentAlertWithTitle(title: "🚨", message: "\(errors.count) fields are missing")
//            return
//        }
//        //getting data from the row
//        let usernameRow: TextRow? = form.rowBy(tag: "Username")
//        let passwordRow: PasswordRow? = form.rowBy(tag: "Password")
//        let phoneRow: PhoneRow? = form.rowBy(tag: "Phone Number")
//        
//        
//        //convert data to string ,INT ,etc
//        let username = usernameRow?.value ?? ""
//        let password = passwordRow?.value ?? ""
//        let phonenumber = phoneRow?.value ?? ""
//        
//        
//        
//        let user = User(userName: username, phoneNumber: password, password: phonenumber)
//        print(user)
//        
//        
//        //            NetworkManager.shared.signup(user: user) { success in
//        //                DispatchQueue.main.async{
//        //                    switch success {
//        //                    case .success(let tokenResponse):
//        //                        let signupVC = AccountViewController()
//        //                        signupVC.token = tokenResponse.token
//        //                        self.navigationController?.pushViewController(signupVC, animated: true)
//        //                        print("Successful Token\(tokenResponse.token)")
//        //                    case .failure(let afError):
//        //                        print(afError)
//        //                    }
//        //                }
//        //
//        //            }
//        //        }
//        
//        func presentAlertWithTitle(title: String, message: String) {
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alert, animated: true, completion: nil)
//        }
//        
//    }
//}

class SignUpViewController: UIViewController {
    
    let nameTextField = UITextField()
    let usernameTextField = UITextField()
    let emailTextField = UITextField()
    let phoneTextField = UITextField()
    let addressTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViews()
        AutoLayout()
    }
    
    func setUpUI() {
        view.backgroundColor = .white
        
        // Set up nameTextField
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        
        // Set up usernameTextField
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .roundedRect
        
        // Set up emailTextField
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        
        // Set up phoneTextField
        phoneTextField.placeholder = "Phone"
        phoneTextField.borderStyle = .roundedRect
        
        // Set up addressTextField
        addressTextField.placeholder = "Address"
        addressTextField.borderStyle = .roundedRect
        
        // Set up passwordTextField
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        // Set up confirmPasswordTextField
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.isSecureTextEntry = true
        
        // Set up registerButton
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    func setupViews() {
        view.addSubview(nameTextField)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(phoneTextField)
        view.addSubview(addressTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(registerButton)
    }
    
    func AutoLayout() {
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        addressTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(addressTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
        }
    }
    
    @objc func registerButtonTapped() {
        // Handle registration logic
        // Once registered, navigate to the next screen
    }
}
