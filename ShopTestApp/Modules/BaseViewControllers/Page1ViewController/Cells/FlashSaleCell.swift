//
//  FlashSaleCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 18.03.23.
//

import UIKit

final class FlashSaleCell: UICollectionViewCell {

  //MARK: - Properties

  private let discountLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: Fonts.boldFont, size: 10.0)
    return label
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 13.0)
    label.textColor = .white
    return label
  }()

  private let categoryLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 10.0)
    label.textColor = .black
    return label
  }()

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 10.0)
    label.textColor = .white
    return label
  }()

  private let imageView: UIImageView = {
    let image = UIImageView()
    image.simpleMakeRounded(radius: 10.0)
    image.contentMode = .scaleAspectFill
    return image
  }()

  private let sellerimageView: UIImageView = {
    let image = UIImageView()
    image.simpleMakeRounded(radius: 10.0)
    image.contentMode = .scaleAspectFill
    image.image = UIImage(named: "seller")
    return image
  }()

  private let bookmarksButton: UIImageView = {
    let button = UIImageView()
    button.image = UIImage(named: "bookmarksButton")
    button.contentMode = .scaleAspectFill
    return button
  }()

  private let bookmarksLoveButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "bookmarkFlashSale"), for: .normal)
    return button
  }()

  private let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.categoryBackground
    view.simpleMakeRounded(radius: 5.0)
    view.alpha = 0.85
    return view
  }()

  private let discountContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.discountBackground
    view.simpleMakeRounded(radius: 5.0)
    return view
  }()

  //MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Configure

  func configure(with model: FlashSale) {
    discountLabel.text = "\(model.discount)% off"
    priceLabel.text = "$ \(model.price)"
    nameLabel.text = model.name
    categoryLabel.text = model.category
    if let imageURL = URL(string: model.imageURL) {
      imageView.sd_setImage(with: imageURL)
    }
  }
}

//MARK: - Set Constraints

extension FlashSaleCell {
  func setConstraints() {
    contentView.addSubview(imageView)
    contentView.addSubview(sellerimageView)
    contentView.addSubview(containerView)
    containerView.addSubview(categoryLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(nameLabel)
    contentView.addSubview(bookmarksButton)
    contentView.addSubview(discountContainerView)
    discountContainerView.addSubview(discountLabel)
    contentView.addSubview(bookmarksLoveButton)

    sellerimageView.snp.makeConstraints { make in
      make.top.left.equalToSuperview().offset(10.0)
    }

    containerView.snp.makeConstraints { make in
      make.height.equalTo(17.0)
      make.width.equalTo(50.0)
      make.left.equalTo(nameLabel.snp.left)
      make.bottom.equalTo(nameLabel.snp.top).inset(-10.0)
    }

    categoryLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    bookmarksButton.snp.makeConstraints { make in
      make.size.equalTo(35.0)
      make.right.bottom.equalToSuperview().inset(5.0)
    }

    bookmarksLoveButton.snp.makeConstraints { make in
      make.size.equalTo(28.0)
      make.right.equalTo(bookmarksButton.snp.left).offset(-5.0)
      make.bottom.equalTo(bookmarksButton.snp.bottom)
    }

    priceLabel.snp.makeConstraints { make in
      make.left.bottom.equalToSuperview().inset(7.5)
    }

    nameLabel.snp.makeConstraints { make in
      make.left.equalTo(priceLabel.snp.left)
      make.bottom.equalToSuperview().inset(30.0)
    }

    discountContainerView.snp.makeConstraints { make in
      make.height.equalTo(18.0)
      make.width.equalTo(50.0)
      make.top.equalToSuperview().offset(10.0)
      make.right.equalToSuperview().offset(-10.0)
    }
    discountLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
}
