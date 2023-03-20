//
//  HeaderTitleViewCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 17.03.23.
//

import UIKit

final class HeaderTitleViewCell: UICollectionReusableView {

  private let headerTitle: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.boldFont, size: 15.0)
    return label
  }()

  private let viewAllLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 10.0)
    label.textColor = Colors.changePhoto
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setContstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with title: String, viewAll: Bool) {
    headerTitle.text = title
    if viewAll {
      viewAllLabel.text = "View all"
    }
  }

  func setContstraints() {
    self.addSubview(headerTitle)
    self.addSubview(viewAllLabel)

    viewAllLabel.snp.makeConstraints { make in
      make.top.bottom.right.equalToSuperview().inset(7.0)
    }

    headerTitle.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.left.equalToSuperview().inset(7.0)
    }
  }

}
