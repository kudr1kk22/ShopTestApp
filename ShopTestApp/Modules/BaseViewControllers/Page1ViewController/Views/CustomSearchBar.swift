//
//  CustomSearchBar.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 20.03.23.
//

import UIKit

final class CustomSearchBar: UICollectionReusableView {

  //MARK: - Properties

  private let searchTextField: UITextField = {
    let centeredParagraphStyle = NSMutableParagraphStyle()
    centeredParagraphStyle.alignment = .center
    let textField = UITextField()
    textField.textAlignment = .center
    textField.roundedBorder()
    textField.attributedPlaceholder = NSAttributedString(
      string: "What are you loking for?",
      attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder, .paragraphStyle: centeredParagraphStyle])
    textField.font = UIFont(name: Fonts.mainFont, size: 10.0)
    textField.backgroundColor = Colors.searchBackground
    return textField
  }()

  private let searchImageView: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "searchIcon")
    return image
  }()

  //MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setContstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

//MARK: - Constraints

extension CustomSearchBar {
  private func setContstraints() {

    let containerView = UIView()

    self.addSubview(containerView)
    containerView.addSubview(searchTextField)
    containerView.addSubview(searchImageView)

    containerView.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.height.equalTo(24.0)
      make.left.equalTo(57.0)
      make.right.equalTo(-57.0)
    }

    searchTextField.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    searchImageView.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(7.5)
      make.right.equalToSuperview().inset(17.5)
    }
  }
}
