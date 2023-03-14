//
//  ProfileTableViewCell.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 10.5)
    label.textColor = Colors.cellTextColor
    return label
  }()

  private let balanceCountLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 10.5)
    label.textColor = Colors.cellTextColor
    return label
  }()

  private let cellImageView: UIImageView = {
    let image = UIImageView()
    return image
  }()

  private let circleImageView: UIImageView = {
    let image = UIImageView()
    return image
  }()

  //MARK: - Initialization

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setContstraints()
    addSelectedCircle()
    self.backgroundColor = Colors.backgroundColor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Configure

  func configure(with model: ProfileMenu) {
    nameLabel.text = model.title
    cellImageView.image = model.image
    if model.enclosure {
      self.accessoryType = .disclosureIndicator
      let arrowImageView = UIImageView(image: UIImage(named: "arrow"))
      arrowImageView.frame = CGRect(x: contentView.bounds.width - 40, y: (contentView.bounds.height - 20) / 2, width: 5.5, height: 10)
      self.accessoryView = arrowImageView
    }

    switch model.balanceCount {
    case .none:
      return
    case .some(_):
      balanceCountLabel.text = model.balanceCount
    }
   
  }

  //MARK: - Constraints

  private func setContstraints() {

    let containerView: UIView = UIView()
    let screenBounds = UIScreen.main.bounds

    contentView.addSubview(nameLabel)
    contentView.addSubview(containerView)
    contentView.addSubview(balanceCountLabel)
    containerView.addSubview(circleImageView)
    containerView.addSubview(cellImageView)

    containerView.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalTo(screenBounds.width / 10.0)
    }

    cellImageView.snp.makeConstraints { make in
      make.center.equalTo(containerView.center)
    }

    circleImageView.snp.makeConstraints { make in
      make.center.equalTo(containerView.center)
    }

    balanceCountLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.right.equalTo(screenBounds.width / -15.0)
    }

    nameLabel.snp.makeConstraints { make in
      make.centerY.top.equalToSuperview()
      make.left.equalTo(cellImageView.snp.right).offset(17.6)
    }
  }

}

//MARK: - Add Circle image

extension ProfileTableViewCell {
  private func addSelectedCircle() {
    let circleImage = UIImage.circle(diameter: 40, color: Colors.tabBarSelectedItem)
    circleImageView.image = circleImage
  }
}
