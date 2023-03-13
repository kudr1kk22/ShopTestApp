//
//  LoginViewController.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

final class LoginViewController: UIViewController {

  //MARK: - Properties

  private let welcomeBackLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 25.0)
    label.text = "Welcome back"
    label.textColor = Colors.signInLabel
    return label
  }()

  private let firstnameTextField: UITextField = {
    let centeredParagraphStyle = NSMutableParagraphStyle()
    centeredParagraphStyle.alignment = .center
    let textField = UITextField()
    textField.textAlignment = .center
    textField.roundedBorder()
    textField.attributedPlaceholder = NSAttributedString(
      string: "First Name",
      attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder, .paragraphStyle: centeredParagraphStyle])
    textField.font = UIFont(name: Fonts.mainFont, size: 10.0)
    textField.backgroundColor = Colors.textField


    return textField
  }()

  private let passwordTextField: UITextField = {
    let centeredParagraphStyle = NSMutableParagraphStyle()
    centeredParagraphStyle.alignment = .center
    let textField = UITextField()
    textField.textAlignment = .center
    textField.roundedBorder()
    textField.attributedPlaceholder = NSAttributedString(
      string: "Password",
      attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder, .paragraphStyle: centeredParagraphStyle])
    textField.font = UIFont(name: Fonts.mainFont, size: 10.0)
    textField.backgroundColor = Colors.textField
    textField.isSecureTextEntry = true


    return textField
  }()

  private let logInButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 14.0)
    button.backgroundColor = Colors.signInbutton
    button.layer.cornerRadius = 15.0
    button.clipsToBounds = true
    return button
  }()

  private let showPasswordButton: UIButton = {
    let rightButton  = UIButton(type: .custom)
    rightButton.setImage(UIImage(named: "showpassword") , for: .normal)
    rightButton.addTarget(LoginViewController.self, action: #selector(toggleShowHide), for: .touchUpInside)
    return rightButton
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setConstraints()
  }

  //MARK: - Actions

  @objc func toggleShowHide(button: UIButton) {
    toggle(button: button, textField: passwordTextField)
  }

  func toggle(button: UIButton, textField: UITextField) {
    textField.isSecureTextEntry = !textField.isSecureTextEntry
    if textField.isSecureTextEntry {
      button.setImage(UIImage(named: "showpassword") , for: .normal)
    } else {
      button.setImage(UIImage(named: "showpassword") , for: .normal) // need another icon
    }
  }


}

//MARK: - Constraints

extension LoginViewController {
  private func setConstraints() {
    
    let screenBounds = UIScreen.main.bounds

    let containerView = UIView()

    view.addSubview(welcomeBackLabel)
    view.addSubview(firstnameTextField)
    view.addSubview(containerView)
    containerView.addSubview(passwordTextField)
    view.addSubview(logInButton)
    containerView.addSubview(showPasswordButton)
    
    welcomeBackLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(screenBounds.height / 6.0)
    }
    
    firstnameTextField.snp.makeConstraints { make in
      make.height.equalTo(29.0)
      make.centerX.equalToSuperview()
      make.left.rightMargin.equalTo(screenBounds.width / 10.0)
      make.top.equalTo(welcomeBackLabel.snp.bottom).offset(77.0)
    }
    
    containerView.snp.makeConstraints { make in
      make.height.equalTo(29.0)
      make.centerX.equalToSuperview()
      make.left.rightMargin.equalTo(screenBounds.width / 10.0)
      make.top.equalTo(firstnameTextField.snp.bottom).offset(35.0)
    }

    passwordTextField.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    showPasswordButton.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.right.equalTo(-15.0)
    }
    
    logInButton.snp.makeConstraints { make in
      make.height.equalTo(46.0)
      make.left.equalTo(passwordTextField.snp.left)
      make.right.equalTo(passwordTextField.snp.right)
      make.top.equalTo(passwordTextField.snp.bottom).offset(35.0)
    }
    
  }
}
