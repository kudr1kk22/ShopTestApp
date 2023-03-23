//
//  ColorsCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 22.03.23.
//

import UIKit

final class ColorsCell: UICollectionViewCell {

  private let view: UIView = {
    let image = UIView()
    image.simpleMakeRounded(radius: 10.0)
    return image
  }()

  override var isSelected: Bool {
      didSet {
          if isSelected {
              layer.borderColor = Colors.borderColor.cgColor
              layer.borderWidth = 2
              layer.cornerRadius = 10
          } else {
              layer.borderColor = nil
              layer.borderWidth = 0
          }
      }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with color: String) {
    view.backgroundColor = UIColor(hexString: color)
  }

}

extension ColorsCell {
  private func setConstraints() {
    contentView.addSubview(view)

    view.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
