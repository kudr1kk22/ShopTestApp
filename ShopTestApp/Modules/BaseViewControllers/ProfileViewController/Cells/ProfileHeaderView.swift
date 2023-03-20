//
//  ProfileHeaderView.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//


import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func presentImagePickerController()
    func dismissImagePickerController()
}

final class ProfileHeaderView: UITableViewHeaderFooterView {

  //MARK: - Init

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)

    initialize()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Properties

  weak var delegate: ProfileHeaderViewDelegate?

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = Colors.profileName
    label.text = "Satria Adhi Prodana"
    label.font = UIFont(name: Fonts.boldFont, size: 12.0)
    return label
  }()

  private let changePhotoButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(Colors.changePhoto, for: .normal)
    button.setTitle("Change photo", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 7.5)
    button.addTarget(self, action: #selector(changePhotoDidTap), for: .touchUpInside)
    return button
  }()

  private let profileImageView: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "avatar")
    return image
  }()

  private let uploadItemIcon: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "uploadItem")
    return image
  }()

  private let uploadItemButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Upload item", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 14.0)
    button.backgroundColor = Colors.signInbutton
    button.layer.cornerRadius = 15.0
    button.clipsToBounds = true
    return button
  }()

  //MARK: - Actions

  @objc private func changePhotoDidTap() {
    delegate?.presentImagePickerController()
  }

  //MARK: - Image Configure

  func congifure(image: UIImage) {
    profileImageView.image = image
    profileImageView.makeRounded()
  }

  //MARK: - Constraints

  private func initialize() {

    let containerView = UIView()
    self.backgroundView = UIView(frame: self.bounds)
    self.backgroundView?.backgroundColor = Colors.backgroundColor

    let screenBounds = UIScreen.main.bounds

    addSubview(containerView)
    addSubview(nameLabel)
    addSubview(profileImageView)
    addSubview(changePhotoButton)
    containerView.addSubview(uploadItemButton)
    containerView.addSubview(uploadItemIcon)

    profileImageView.snp.makeConstraints { make in
      make.width.height.equalTo(60.0)
      make.centerX.equalToSuperview()
    }

    changePhotoButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(profileImageView.snp.bottom)
    }

    nameLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(changePhotoButton.snp.bottom)
    }

    containerView.snp.makeConstraints { make in
      make.height.equalTo(46.0)
      make.left.equalTo(screenBounds.width / 10.0)
      make.right.equalTo(screenBounds.width / -10.0)
      make.top.equalTo(nameLabel.snp.bottom).offset(screenBounds.width / 30.0)
    }

    uploadItemButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    uploadItemIcon.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalTo(52.5)
    }

  }
}
