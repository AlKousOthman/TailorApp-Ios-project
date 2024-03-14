//
//  TailorDetailsViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit

class TailorDetailsViewController: UIViewController {
    let commonPadding: CGFloat = 20
    let notcommonPadding: CGFloat = 10
    private let nameLabel = UILabel()
    private let imageView = UIImageView()
    private let callButton = UIButton()
    private let locationButton = UIButton()
    private let aboutUSLabel = UILabel()
    private let belowaboutUSLabel = UILabel()
    private let openingHoursLabel = UILabel()
    private let belowopeningHoursLabel = UILabel()
    private let ratingLabel = UILabel()
    private let submitRequestButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        locationButton.addTarget(self, action: #selector(openLocationURL), for: .touchUpInside)
        callButton.addTarget(self, action: #selector(makePhoneCall), for: .touchUpInside)

    }
    private func setupViews() {
        
        view.backgroundColor = .white
        //        petNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        //        petIdLabel.font = .systemFont(ofSize: 16, weight: .medium)
        //        petAgeLabel.font = .systemFont(ofSize: 16, weight: .medium)
        //        petAdoptedLabel.font = .systemFont(ofSize: 16, weight: .medium)
        //        petgenderLabel.font = .systemFont(ofSize: 16, weight: .medium)

        // Add the views to the hierarchy
        view.addSubview(nameLabel)
        nameLabel.text = "Tailor name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24) 


        view.addSubview(imageView)
        imageView.image = UIImage(named: "nature1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowRadius = 4
        
        view.addSubview(callButton)
        callButton.backgroundColor = .blue
        callButton.layer.cornerRadius = 10
        callButton.layer.shadowColor = UIColor.black.cgColor
        callButton.layer.shadowOpacity = 0.5
        callButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        callButton.layer.shadowRadius = 4
        // Create a configuration for the SF Symbol with a specific point size, weight, and scale.
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium, scale: .medium)

        // Create an SF Symbol image using the "star.fill" system name and the previously defined configuration.
        let symbolImage = UIImage(systemName: "phone", withConfiguration: symbolConfig)

        // Set the created SF Symbol image as the button's image for the normal state.
        callButton.setImage(symbolImage, for: .normal)
        ///last configurations
        callButton.tintColor = .white

        // Set the title of the button to "Rate Us" for its normal state.
        callButton.setTitle("Call", for: .normal)

        // Set the title color of the button to white for its normal state.
        callButton.setTitleColor(.white, for: .normal)
        ///last configurations
        
    
        
        view.addSubview(locationButton)
        locationButton.backgroundColor = .blue
        locationButton.layer.cornerRadius = 10
        locationButton.layer.shadowColor = UIColor.black.cgColor
        locationButton.layer.shadowOpacity = 0.5
        locationButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        locationButton.layer.shadowRadius = 4
        // Create a configuration for the SF Symbol with a specific point size, weight, and scale.
        let locationSymbolConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium, scale: .medium)

        // Create an SF Symbol image using the "star.fill" system name and the previously defined configuration.
        let locationSymbolImage = UIImage(systemName: "location", withConfiguration: locationSymbolConfig)

        // Set the created SF Symbol image as the button's image for the normal state.
        locationButton.setImage(locationSymbolImage, for: .normal)
        
        locationButton.tintColor = .white

        // Set the title of the button to "Rate Us" for its normal state.
        locationButton.setTitle("Location", for: .normal)

        // Set the title color of the button to white for its normal state.
        locationButton.setTitleColor(.white, for: .normal)
        
        
        
        view.addSubview(aboutUSLabel)
        aboutUSLabel.text = "About this tailor"
        aboutUSLabel.font = UIFont.boldSystemFont(ofSize: 18)

        view.addSubview(belowaboutUSLabel)
        belowaboutUSLabel.text = "below aboutUS"
        
        view.addSubview(openingHoursLabel)
        openingHoursLabel.text = "Opening Hours"
        openingHoursLabel.font = UIFont.boldSystemFont(ofSize: 18)

        view.addSubview(belowopeningHoursLabel)
        belowopeningHoursLabel.text = "Below  opening Hours"
        
        view.addSubview(ratingLabel)
        ratingLabel.text = "Rating"
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 18)

        view.addSubview(submitRequestButton)
        submitRequestButton.backgroundColor = .blue
        submitRequestButton.layer.cornerRadius = 10
        submitRequestButton.layer.shadowColor = UIColor.black.cgColor
        submitRequestButton.layer.shadowOpacity = 0.5
        submitRequestButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        submitRequestButton.layer.shadowRadius = 4
        
        let requestSymbolConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium, scale: .medium)

        // Create an SF Symbol image using the "star.fill" system name and the previously defined configuration.
        let requestSymbolImage = UIImage(systemName: "submit", withConfiguration: requestSymbolConfig)

        // Set the created SF Symbol image as the button's image for the normal state.
        submitRequestButton.setImage(requestSymbolImage, for: .normal)
        
        submitRequestButton.tintColor = .white

        // Set the title of the button to "Rate Us" for its normal state.
        submitRequestButton.setTitle("Submit request", for: .normal)

        // Set the title color of the button to white for its normal state.
        submitRequestButton.setTitleColor(.white, for: .normal)
    }
    
    private func setupConstraints(){
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(commonPadding)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(350)
        }
        callButton.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(230)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(170)
            make.height.equalTo(50)
        }
        locationButton.snp.makeConstraints { make in
            make.centerY.equalTo(callButton.snp.centerY) // This aligns locationButton vertically with callButton
                    make.leading.equalTo(callButton.snp.trailing).offset(20) // Position locationButton 20pts right from callButton; adjust as needed
            make.width.equalTo(170)
            make.height.equalTo(50)
        }
        
        aboutUSLabel.snp.makeConstraints { make in
            make.top.equalTo(locationButton).offset(60)
            make.leading.equalToSuperview().offset(commonPadding)
        }
        belowaboutUSLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutUSLabel).offset(40)
            make.leading.equalToSuperview().offset(notcommonPadding)
        }
        
        openingHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(belowaboutUSLabel).offset(40)
            make.leading.equalToSuperview().offset(commonPadding)
        }
        belowopeningHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(openingHoursLabel).offset(40)
            make.leading.equalToSuperview().offset(notcommonPadding)

        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(belowopeningHoursLabel).offset(40)
            make.leading.equalToSuperview().offset(commonPadding)
        }
        
        submitRequestButton.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
    }
    @objc private func openLocationURL() {
        guard let url = URL(string: "https://www.google.com/maps") else {
            print("Invalid URL")
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func makePhoneCall() {
        let phoneNumber = "1234567890" // Replace with the phone number you want to call
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(phoneCallURL) {
            UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
        } else {
            print("Unable to call.")
        }
    }

}
