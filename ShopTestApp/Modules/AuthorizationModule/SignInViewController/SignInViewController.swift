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

  private lazy var signInButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Sign in", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.mainFont, size: 14.0)
    button.backgroundColor = Colors.signInbutton
    button.layer.cornerRadius = 15.0
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(signInButtonTapped(_:)), for: .touchUpInside)
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

  private let viewModel: SignInVCViewModelProtocol

  //MARK: - Initialization

  init(viewModel: SignInVCViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setConstraints()
    textFieldSetDelegate()
    setGesture()
    navigationController?.navigationBar.isHidden = true
    self.hideKeyboardWhenTappedAround()
  }

  //MARK: - Gestures

  private func setGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
    logInLabel.isUserInteractionEnabled = true
    logInLabel.addGestureRecognizer(tapGesture)
  }

  @objc private func labelTapped(_ sender: UITapGestureRecognizer) {
    viewModel.openLoginScene()
  }

  //MARK: - Actions

  @objc func signInButtonTapped(_ sender: UIButton) {
    guard let email = emailTextField.text else { return }
    if viewModel.isValidEmail(email: email) {
      print("Email address is valid")
      let savedName = viewModel.saveNameToKeychain(email: email)
      if savedName {
        print("Name successfully saved to Keychain")
        presentMainWindow()
      } else {
        showAlert()
      }
    } else {
      showAlert()
    }
  }

  func presentMainWindow() {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
    let windows = windowScene.windows
    if let firstWindow = windows.first {
      firstWindow.rootViewController = TabBarViewController()
      firstWindow.makeKeyAndVisible()
    }
  }

  //MARK: - Alert

  private func showAlert() {
    let alertController = UIAlertController(title: "Ошибка", message: "Неправильный email или пользователь уже зарегистрирован", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}

extension SignInViewController {
  func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}


// MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {

  private func textFieldSetDelegate() {
    firstnameTextField.delegate = self
    lastnameTextField.delegate = self
    emailTextField.delegate = self
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if !textField.hasText {
      return false
    }
    textField.resignFirstResponder()

    switch textField {
    case firstnameTextField:
      lastnameTextField.becomeFirstResponder()
    case lastnameTextField:
      emailTextField.becomeFirstResponder()
    default:
      break
    }
    return true
  }

  func textFieldDidBeginEditing(_ textField: UITextField) {
    switch textField {
    case firstnameTextField:
      textField.returnKeyType = .next
    case lastnameTextField:
      textField.returnKeyType = .next
    default:
      break
    }
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

