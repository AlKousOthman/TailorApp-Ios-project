//
//  WelcomePageViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//
//

import UIKit
import SnapKit

class  WelcomePageViewController: UIViewController {

    var tailorWelcomeImageView = UIImageView()
    var signInButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        setupViews()
        AutoLayout()
    }

    func setUpUI() {
        // Set up tailor welcome image
        tailorWelcomeImageView.image = UIImage(named: "Tailoring-icon")

        // Set up sign-in button
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(tailorWelcomeImageView)
        view.addSubview(signInButton)
    }

    func AutoLayout() {
        tailorWelcomeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
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
