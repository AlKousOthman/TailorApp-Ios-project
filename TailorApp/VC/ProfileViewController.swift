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
    var usernameLabel = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()
    var addressLabel = UILabel()
    var signoutButton =  UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setupViews()
        AutoLAyout()
        

        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
//        signoutButton.setTitle("sign out", for: .normal)
//        signoutButton.backgroundColor = .lightGray
//        signoutButton.setTitleColor(.black, for: .normal)
//        signoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        signoutButton.layer.cornerRadius = 10
//        signoutButton.layer.borderWidth = 1
//        signoutButton.layer.borderColor = UIColor.white.cgColor
        
        let powerImage = UIImage(systemName: "power")
                
                // Set the image for the button
                signoutButton.setImage(powerImage, for: .normal)
                
                // Customize other properties of the button
                signoutButton.backgroundColor = .lightGray
                signoutButton.tintColor = .black // Change the color of the symbol
                signoutButton.layer.cornerRadius = 10
                signoutButton.layer.borderWidth = 1
                signoutButton.layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    func setupViews(){
        view.backgroundColor = .white

        view.addSubview(userImage)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(addressLabel)
        view.addSubview(signoutButton)
        
    }
    
    func AutoLAyout(){

        signoutButton.snp.makeConstraints { make in
           //make.top.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(300)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(50)
            
        }
        
        
    }
    



}
