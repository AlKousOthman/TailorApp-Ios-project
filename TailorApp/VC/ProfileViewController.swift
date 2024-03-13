//
//  ProfileViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var userImage = UIImageView()
    var nameLabel = UILabel()
    var usernameLabel = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()
    var addressLabel = UILabel()
    var signoutButton =  UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setupViews()
        AutoLayout()

        
        let placeholderImage = UIImage(named: "profileimage") 
            userImage.image = placeholderImage
            
            nameLabel.text = "razan alshatti"
            usernameLabel.text = "razzan24"
            emailLabel.text = "razanalsh@example.com"
            phoneLabel.text = "+965 94010640"
            addressLabel.text = "123 Street, Kuwait City"

        
       
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        
        let powerImage = UIImage(systemName: "power")
        
        // Profile Image View
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 100 // circular profile image
        
        
        // Name Label
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        // Username Label
        usernameLabel.textAlignment = .center
        usernameLabel.font = UIFont.systemFont(ofSize: 18)
        
        // Email Label
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        
        // Phone Label
        phoneLabel.textAlignment = .center
        phoneLabel.font = UIFont.systemFont(ofSize: 18)
        
        // Address Label
        addressLabel.textAlignment = .center
        addressLabel.font = UIFont.systemFont(ofSize: 18)

        
        // Signout Button
        signoutButton.setImage(powerImage, for: .normal)
        signoutButton.backgroundColor = .lightGray
        signoutButton.tintColor = .black 
        signoutButton.layer.cornerRadius = 10
        signoutButton.layer.borderWidth = 1
        signoutButton.layer.borderColor = UIColor.white.cgColor
        signoutButton.setTitle("Sign Out", for: .normal)
        signoutButton.backgroundColor = .systemRed
        signoutButton.setTitleColor(.white, for: .normal)
        signoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signoutButton.layer.cornerRadius = 10
        signoutButton.addTarget(self, action: #selector(signoutButtonTapped), for: .touchUpInside)

        
    }
    
    func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(userImage)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(addressLabel)
        view.addSubview(signoutButton)
        
    }
    
    func AutoLayout() {
        
        userImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.size.equalTo(200)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(20)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
        }
        
        signoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func signoutButtonTapped() {
       
    }


}
