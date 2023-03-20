//
//  CategoryCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 16.03.23.
//

import UIKit

final class CategoryCell: UICollectionViewCell {

  private let imageView: UIImageView = {
    let image = UIImageView()
    return image
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 10.0)
    label.textColor = Colors.changePhoto
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(model: CategoryCellModel) {
    imageView.image = model.image
    titleLabel.text = model.title
  }

}

extension CategoryCell {
  private func setConstraints() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    imageView.snp.makeConstraints { make in
      make.top.left.right.equalToSuperview()
    }

    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(15.0)
      make.centerX.equalToSuperview()
    }
  }
}
