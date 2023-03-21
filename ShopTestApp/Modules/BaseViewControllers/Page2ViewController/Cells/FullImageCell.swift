//
//  FullImageCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 20.03.23.
//

import UIKit

final class FullImageCell: UICollectionViewCell {

  private let imageView: UIImageView = {
    let image = UIImageView()
    image.simpleMakeRounded(radius: 5.0)
    return image
  }()

  private let bookmarksSharedView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.bookmarksShared
    view.simpleMakeRounded(radius: 15.0)

    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(with image: String) {
    let imageURL = URL(string: image)
        imageView.sd_setImage(with: imageURL)
    }
}

extension FullImageCell {
  private func setConstraints() {

    let bookmarskButton = UIButton()
    bookmarskButton.setImage(UIImage(named: "bookmark"), for: .normal)

    let sharedButton = UIButton()
    sharedButton.setImage(UIImage(named: "shared"), for: .normal)

    let separator = UIImageView()
    separator.image = UIImage(named: "separator")

    contentView.addSubview(imageView)
    contentView.addSubview(bookmarksSharedView)
    bookmarksSharedView.addSubview(bookmarskButton)
    bookmarksSharedView.addSubview(sharedButton)
    bookmarksSharedView.addSubview(separator)

    imageView.snp.makeConstraints { make in
      make.top.left.bottom.equalToSuperview()
      make.right.equalTo(-35.0)
    }

    bookmarksSharedView.snp.makeConstraints { make in
      make.height.equalTo(95.0)
      make.width.equalTo(42.0)
      make.centerX.equalTo(imageView.snp.right)
      make.centerY.equalTo(imageView.snp.bottom).inset(70.0)
    }

    separator.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    bookmarskButton.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.bottom.equalTo(separator.snp.top).offset(-14.5)
    }

    sharedButton.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.top.equalTo(separator.snp.bottom).offset(14.5)
    }
  }
}
