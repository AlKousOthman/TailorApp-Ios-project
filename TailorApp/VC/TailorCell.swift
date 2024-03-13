//
//  TailorCell.swift
//  TailorApp
//
//  Created by Noura Aldaihani on 13/03/2024.
//

import UIKit

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

          profileImageView.translatesAutoresizingMaskIntoConstraints = false
          nameLabel.translatesAutoresizingMaskIntoConstraints = false
          ratingStackView.translatesAutoresizingMaskIntoConstraints = false

          NSLayoutConstraint.activate([
              profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
              profileImageView.widthAnchor.constraint(equalToConstant: 100),
              profileImageView.heightAnchor.constraint(equalToConstant: 100),

              nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
              nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),

              ratingStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
              ratingStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
          ])

          ratingStackView.axis = .horizontal
          ratingStackView.spacing = 4
      }

      func configure(with tailor: TailorList) {
          profileImageView.image = tailor.profileImage
          nameLabel.text = tailor.name
          addStarRating(rating: tailor.rating)
      }

      private func addStarRating(rating: Double) {
          let roundedRating = min(max(rating, 0), 5) 
          for i in 1...5 {
              let starImageView: UIImageView
              if roundedRating >= Double(i) {
                  starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
              } else if roundedRating > Double(i) - 1 {
                  starImageView = UIImageView(image: UIImage(systemName: "star.lefthalf.fill"))
              } else {
                  starImageView = UIImageView(image: UIImage(systemName: "star"))
              }
              ratingStackView.addArrangedSubview(starImageView)
          }
      }
  }

