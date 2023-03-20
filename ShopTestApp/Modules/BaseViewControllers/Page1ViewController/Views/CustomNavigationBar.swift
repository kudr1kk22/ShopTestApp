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
    label.text = "Trade by Bata"
    return label
  }()

  //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
      setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Разместите ваши элементы управления здесь, используя методы setFrame или AutoLayout
    }

}

//MARK: - Constraints

extension CustomNavigationBar {
  private func setConstraints() {
    self.addSubview(titleLabel)

    titleLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

  }
}
