//
//  CustomNavigationBar.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 18.03.23.
//

import UIKit

final class CustomNavigationBar: UIView {

  //MARK: - Properties

  private let titleLabel: UILabel = {
    let label = UILabel()
    let string = "Trade by bata"
    let attrString = NSMutableAttributedString(string: string)
    attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.bataColor, range: NSRange(location: 9, length: 4))
    if let font = UIFont(name: Fonts.boldFont, size: 20.0) {
      attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attrString.length))
    }
    label.attributedText = attrString
    return label
  }()

  private let detailsButton: UIButton = {
    let image = UIImage(named: "detailsNavbar")
    let button = UIButton()
    button.frame = CGRectMake(0, 0, 51, 31)
    button.setImage(image, for: .normal)
    return button
  }()

  private let profileView = UIView()

  private let profileImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "avatar")
    return image
  }()

  private let profileLocation: UILabel = {
    let label = UILabel()
    label.text = "Location"
    label.font = UIFont(name: Fonts.mainFont, size: 7.0)
    label.textAlignment = .center
    label.textColor = Colors.textFieldPlaceHolder

    return label
  }()

  private let chevronImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(systemName: "chevron.down")
    imageView.tintColor = .black
    return imageView
  }()

  //MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
    addObserverNotification()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Observer
  
  private func addObserverNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(updateImage(_:)), name: Notification.Name("ImageNotification"), object: nil)
  }

  @objc func updateImage(_ notification: Notification) {
    if let image = notification.userInfo?["image"] as? UIImage {
      profileImage.image = image
      profileImage.makeRounded()
    }
  }

  //MARK: - Deinit

  deinit {
      NotificationCenter.default.removeObserver(self)
  }

}

//MARK: - Constraints

extension CustomNavigationBar {
  private func setConstraints() {
    self.addSubview(detailsButton)
    self.addSubview(profileView)
    self.addSubview(titleLabel)
    profileView.addSubview(profileImage)
    profileView.addSubview(profileLocation)
    profileView.addSubview(chevronImage)

    self.snp.makeConstraints { make in
      make.height.equalTo(70.0)
    }

    detailsButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalToSuperview().inset(16.0)
    }

    profileView.snp.makeConstraints { make in
      make.height.width.equalTo(55.0)
      make.centerY.equalToSuperview()
      make.right.equalToSuperview().inset(32.0)
    }

    profileImage.snp.makeConstraints { make in
      make.height.width.equalTo(30.0)
      make.center.equalToSuperview()
    }

    profileLocation.snp.makeConstraints { make in
      make.top.equalTo(profileImage.snp.bottom)
      make.left.bottom.right.equalToSuperview()
    }

    chevronImage.snp.makeConstraints { make in
      make.top.equalTo(profileLocation.snp.top)
      make.right.equalTo(profileLocation.snp.right)
      make.bottom.equalTo(profileLocation.snp.bottom)
    }

    titleLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
}
