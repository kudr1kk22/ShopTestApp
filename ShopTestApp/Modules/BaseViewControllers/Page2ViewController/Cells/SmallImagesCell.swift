//
//  SmallImagesCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 21.03.23.
//

import UIKit

final class SmallImagesCell: UICollectionViewCell {

  private let imageView: UIImageView = {
    let image = UIImageView()
    image.simpleMakeRounded(radius: 5.0)
    return image
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

extension SmallImagesCell {
  private func setConstraints() {
    contentView.addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
