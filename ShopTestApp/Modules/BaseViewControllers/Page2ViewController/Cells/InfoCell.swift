//
//  InfoCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 21.03.23.
//

import UIKit

final class InfoCell: UICollectionViewCell {

  private let itemNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 17.0)
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 17.0)
    return label
  }()

  private let discriptionItemLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 13.0)
    label.numberOfLines = 0
    label.textColor = Colors.changePhoto
    return label
  }()

  private let ratingLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 13.0)
    return label
  }()

  private let numberOfReviewsLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 13.0)
    label.textColor = Colors.changePhoto
    return label
  }()

  private let starImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "star")
    return image
  }()

  private let colorsLabel: UILabel = {
    let label = UILabel()
    label.text = "Color:"
    label.font = UIFont(name: Fonts.boldFont, size: 13.0)
    label.textColor = Colors.textFieldPlaceHolder
    return label
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with model: FlashDetailsModel) {
    itemNameLabel.text = model.name
    priceLabel.text = "$ \(model.price)"
    discriptionItemLabel.text = model.description
    ratingLabel.text = "\(model.rating)"
    numberOfReviewsLabel.text = "(\(model.numberOfReviews) reviews)"
  }

}

extension InfoCell {
  private func setConstraints() {
    contentView.addSubview(itemNameLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(discriptionItemLabel)
    contentView.addSubview(ratingLabel)
    contentView.addSubview(numberOfReviewsLabel)
    contentView.addSubview(starImage)
    contentView.addSubview(colorsLabel)

    let screenBounds = UIScreen.main.bounds

    itemNameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.equalToSuperview().inset(20.0)
    }

    starImage.snp.makeConstraints { make in
      make.centerY.equalTo(ratingLabel.snp.centerY)
      make.left.equalTo(itemNameLabel.snp.left)
    }

    ratingLabel.snp.makeConstraints { make in
      make.top.equalTo(discriptionItemLabel.snp.bottom).offset(8.0)
      make.left.equalTo(starImage.snp.right).offset(4.0)
    }

    numberOfReviewsLabel.snp.makeConstraints { make in
      make.top.equalTo(ratingLabel.snp.top)
      make.left.equalTo(ratingLabel.snp.right).offset(4.0)
    }

    priceLabel.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.right.equalToSuperview().inset(20.0)
    }

    discriptionItemLabel.snp.makeConstraints { make in
      make.width.equalTo(screenBounds.width / 2)
      make.top.equalTo(itemNameLabel.snp.bottom).offset(8.0)
      make.left.equalTo(itemNameLabel.snp.left)
    }

    colorsLabel.snp.makeConstraints { make in
      make.top.equalTo(numberOfReviewsLabel.snp.bottom).offset(8.0)
      make.left.equalTo(starImage.snp.left)
    }
  }
}

