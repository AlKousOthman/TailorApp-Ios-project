//
//  TailorCell.swift
//  TailorApp
//
//  Created by Noura Aldaihani on 13/03/2024.
//

import UIKit
import SnapKit

class TailorCell: UITableViewCell {
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let ratingStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingStackView)
        profileImageView.image = UIImage(named: "tailor1")

        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        ratingStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().offset(-16)
        }

        nameLabel.font = UIFont.boldSystemFont(ofSize: 18) 
        nameLabel.textColor = UIColor.black

        ratingStackView.axis = .horizontal
        ratingStackView.spacing = 4
    }

    func configure(with tailor: TailorList) {
        nameLabel.text = tailor.name
        addStarRating(rating: tailor.rating)
    }

    private func addStarRating(rating: Double) {
        let roundedRating = min(max(rating, 0), 5)
        for i in 1...5 {
            let starImageView: UIImageView
            if roundedRating >= Double(i) {
                starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
                starImageView.tintColor = UIColor.systemYellow
            } else if roundedRating > Double(i) - 1 {
                starImageView = UIImageView(image: UIImage(systemName: "star.lefthalf.fill"))
                starImageView.tintColor = UIColor.systemYellow
            } else {
                starImageView = UIImageView(image: UIImage(systemName: "star"))
                starImageView.tintColor = UIColor.systemGray
            }
            ratingStackView.addArrangedSubview(starImageView)
        }
    }
}

