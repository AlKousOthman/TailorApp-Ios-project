//
//  WelcomePageViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//
//

import UIKit
import SnapKit
import UIKit

class WelcomePageViewController: UIViewController {

    var tailorWelcomeImageView = UIImageView()
    var signInButton = UIButton(type: .system)
    var headerLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        setupViews()
        AutoLayout()
    }

    func setUpUI() {
        
        tailorWelcomeImageView.image = UIImage(named: "Tailoring-icon")

        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        
        headerLabel.text = "WELCOME TO TAILOR EXPRESS"
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.textColor = .systemBlue
        headerLabel.textAlignment = .center
        
    
        
    }

    func setupViews() {
       
        view.backgroundColor = .white
        view.addSubview(headerLabel)
        view.addSubview(tailorWelcomeImageView)
        view.addSubview(signInButton)
    }

    func AutoLayout() {
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalToSuperview()
        }
        
        tailorWelcomeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50) 
            make.width.equalTo(200)
            make.height.equalTo(200)
        }

        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tailorWelcomeImageView.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
        }
    }

    @objc func signInButtonTapped() {
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }
}

