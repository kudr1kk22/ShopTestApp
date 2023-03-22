//
//  PurchaseView.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 22.03.23.
//

import UIKit

final class PurchaseView: UIView {

  //MARK: - Properties

  private let quantityLabel: UILabel = {
    let label = UILabel()
    label.textColor = Colors.changePhoto
    label.text = "Quentity:"
    label.font = UIFont(name: Fonts.boldFont, size: 10.0)
    return label
  }()

  private let minusButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.setTitle("-", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 15.0)
    button.backgroundColor = Colors.signInbutton
    button.layer.cornerRadius = 10.0
    button.clipsToBounds = true
//    button.addTarget(self, action: #selector(signInButtonTapped(_:)), for: .touchUpInside)
    return button
  }()

  private let plusButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.setTitle("+", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 15.0)
    button.backgroundColor = Colors.signInbutton
    button.layer.cornerRadius = 10.0
    button.clipsToBounds = true
//    button.addTarget(self, action: #selector(signInButtonTapped(_:)), for: .touchUpInside)
    return button
  }()

  private let addCardView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.signInbutton
    view.layer.cornerRadius = 15.0
    view.clipsToBounds = true
    return view
  }()

  private let addToCardButton: UIButton = {
    let button = UIButton()
    button.setTitle("ADD TO CART", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.boldFont, size: 10.0)
    return button
  }()

  private let costLabel: UILabel = {
    let label = UILabel()
    label.textColor = Colors.costColor
    label.text = "# "
    label.textAlignment = .center
    label.font = UIFont(name: Fonts.boldFont, size: 10.0)
    return label
  }()

//MARK: - init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraints()
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    self.backgroundColor = Colors.purchaseBackground
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 30
    self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }


}

extension PurchaseView {
  private func setConstraints() {
    self.addSubview(quantityLabel)
    self.addSubview(plusButton)
    self.addSubview(minusButton)
    self.addSubview(addCardView)
    addCardView.addSubview(addToCardButton)
    addCardView.addSubview(costLabel)

    let screenBounds = UIScreen.main.bounds

    quantityLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(17.0)
      make.left.equalToSuperview().inset(24.0)
    }

    addCardView.snp.makeConstraints { make in
      make.top.equalTo(quantityLabel.snp.top)
      make.left.equalTo(screenBounds.width / 2)
      make.right.equalToSuperview().inset(23.0)
      make.bottom.equalTo(minusButton.snp.bottom)
    }

    addToCardButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalTo(addCardView.snp.centerX)
    }

    costLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.right.equalTo(addCardView.snp.centerX)
      make.width.equalTo(addCardView.snp.width).dividedBy(2)
    }

    minusButton.snp.makeConstraints { make in
      make.width.equalTo(50.0)
      make.top.equalTo(quantityLabel.snp.bottom).offset(16.0)
      make.left.equalTo(quantityLabel.snp.left)
    }

    plusButton.snp.makeConstraints { make in
      make.width.equalTo(50.0)
      make.top.equalTo(quantityLabel.snp.bottom).offset(16.0)
      make.left.equalTo(minusButton.snp.right).offset(21.0)
    }
  }
}
