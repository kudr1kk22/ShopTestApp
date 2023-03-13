//
//  SignInViewController.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 12.03.23.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController {

  //MARK: - Properties

  private let signInLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 25.0)
    label.text = "Sign in"
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

  private let lastnameTextField: UITextField = {
    let centeredParagraphStyle = NSMutableParagraphStyle()
    centeredParagraphStyle.alignment = .center
    let textField = UITextField()
    textField.textAlignment = .center
    textField.roundedBorder()
    textField.attributedPlaceholder = NSAttributedString(
        string: "Last Name",
        attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder, .paragraphStyle: centeredParagraphStyle])
    textField.font = UIFont(name: Fonts.mainFont, size: 10.0)
    textField.backgroundColor = Colors.textField
    return textField
  }()

  private let emailTextField: UITextField = {
    let centeredParagraphStyle = NSMutableParagraphStyle()
    centeredParagraphStyle.alignment = .center
    let textField = UITextField()
    textField.textAlignment = .center
    textField.roundedBorder()
    textField.attributedPlaceholder = NSAttributedString(
        string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder, .paragraphStyle: centeredParagraphStyle])
    textField.font = UIFont(name: Fonts.mainFont, size: 10.0)
    textField.backgroundColor = Colors.textField
    return textField
  }()

  private let signInButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Sign in", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 14.0)
    button.backgroundColor = Colors.signInbutton
    button.layer.cornerRadius = 15.0
    button.clipsToBounds = true
    return button
  }()

  private let signInWithGoogleButton: UIButton = {
    let button = UIButton()
    button.setTitle("   Sign in with Google", for: .normal)
    button.setImage(UIImage(named: "googleIcon.pdf"), for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 12.0)
    button.setTitleColor(.black, for: .normal)
    return button
  }()

  private let signInWithAppleButton: UIButton = {
    let button = UIButton()
    button.setTitle("   Sign in with Apple", for: .normal)
    button.setImage(UIImage(named: "appleIcon.pdf"), for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 12.0)
    button.setTitleColor(.black, for: .normal)
    return button
  }()

  private let logInConstantLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 10.0)
    label.textColor = Colors.textFieldPlaceHolder
    label.text = "Already have an account?"
    return label
  }()

  private let logInLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.mainFont, size: 10.0)
    label.textColor = Colors.logIn
    label.text = "Log in"
    return label
  }()

  //MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setConstraints()
    setGesture()
  }

  //MARK: - Gestures

  private func setGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
    logInLabel.isUserInteractionEnabled = true
    logInLabel.addGestureRecognizer(tapGesture)
  }

  @objc private func labelTapped(_ sender: UITapGestureRecognizer) {
    let loginViewController = LoginViewController()
    present(loginViewController, animated: true)
  }

}

//MARK: - Constraints

extension SignInViewController {
  private func setConstraints() {

    let screenBounds = UIScreen.main.bounds

    view.addSubview(signInLabel)
    view.addSubview(firstnameTextField)
    view.addSubview(lastnameTextField)
    view.addSubview(emailTextField)
    view.addSubview(signInButton)
    view.addSubview(signInWithGoogleButton)
    view.addSubview(signInWithAppleButton)
    view.addSubview(logInConstantLabel)
    view.addSubview(logInLabel)
    view.addSubview(signInWithGoogleButton)

    signInLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(screenBounds.height / 6.0)
    }

    firstnameTextField.snp.makeConstraints { make in
      make.height.equalTo(29.0)
      make.centerX.equalToSuperview()
      make.left.rightMargin.equalTo(screenBounds.width / 10.0)
      make.top.equalTo(signInLabel.snp.bottom).offset(77.0)
    }

    lastnameTextField.snp.makeConstraints { make in
      make.height.equalTo(29.0)
      make.centerX.equalToSuperview()
      make.left.rightMargin.equalTo(screenBounds.width / 10.0)
      make.top.equalTo(firstnameTextField.snp.bottom).offset(35.0)
    }

    emailTextField.snp.makeConstraints { make in
      make.height.equalTo(29.0)
      make.centerX.equalToSuperview()
      make.left.rightMargin.equalTo(screenBounds.width / 10.0)
      make.top.equalTo(lastnameTextField.snp.bottom).offset(35.0)
    }

    signInButton.snp.makeConstraints { make in
      make.height.equalTo(46.0)
      make.left.equalTo(emailTextField.snp.left)
      make.right.equalTo(emailTextField.snp.right)
      make.top.equalTo(emailTextField.snp.bottom).offset(35.0)
    }

    logInConstantLabel.snp.makeConstraints { make in
      make.left.equalTo(signInButton.snp.left)
      make.top.equalTo(signInButton.snp.bottom).offset(18.0)
    }

    logInLabel.snp.makeConstraints { make in
      make.left.equalTo(logInConstantLabel.snp.right).offset(9.0)
      make.top.equalTo(logInConstantLabel.snp.top)
    }

    signInWithGoogleButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(logInLabel.snp.bottom).offset(80.0)
    }

    signInWithAppleButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(signInWithGoogleButton.snp.bottom).offset(48.0)
    }

  }
}

