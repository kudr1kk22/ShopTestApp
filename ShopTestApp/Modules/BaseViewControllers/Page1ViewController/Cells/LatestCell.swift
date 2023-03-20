//
//  LatestCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 16.03.23.
//

import UIKit
import SDWebImage


final class LatestCell: UICollectionViewCell {

  private let imageView: UIImageView = {
    let image = UIImageView()
    image.simpleMakeRounded(radius: 10.0)
    image.contentMode = .scaleAspectFill
    return image
  }()

  private let categoryLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 6.0)
    label.textColor = .black
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 7.0)
    label.textColor = .white
    return label
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 10.0)
    label.textColor = .white
    return label
  }()

  private let bookmarksButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "bookmarksButton"), for: .normal)
    return button
  }()

  private let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.categoryBackground
    view.simpleMakeRounded(radius: 5.0)
    view.alpha = 0.85
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with model: Latest) {
    categoryLabel.text = model.category
    priceLabel.text = "$ \(model.price)"
    nameLabel.text = model.name
    if let imageURL = URL(string: model.imageURL) {
      imageView.sd_setImage(with: imageURL)
    }
  }



  
}

extension LatestCell {
  func setConstraints() {
    contentView.addSubview(imageView)
    contentView.addSubview(containerView)
    containerView.addSubview(categoryLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(nameLabel)
    contentView.addSubview(bookmarksButton)

    containerView.snp.makeConstraints { make in
      make.height.equalTo(12.0)
      make.width.equalTo(35.0)
      make.left.equalTo(nameLabel.snp.left)
      make.bottom.equalTo(nameLabel.snp.top).inset(-7.0)
    }

    categoryLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    bookmarksButton.snp.makeConstraints { make in
      make.right.bottom.equalToSuperview().inset(5.0)
    }

    priceLabel.snp.makeConstraints { make in
      make.left.bottom.equalToSuperview().inset(7.5)
    }

    nameLabel.snp.makeConstraints { make in
      make.left.equalTo(priceLabel.snp.left)
      make.bottom.equalToSuperview().inset(30.0)
    }
  }
}
