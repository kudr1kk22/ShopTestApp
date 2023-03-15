//
//  ProfileViewController.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

final class ProfileViewController: UIViewController {

  //MARK: - Properties

  private lazy var tableView = UITableView(frame: .zero, style: .grouped)
  private lazy var headerView = ProfileHeaderView()
  private var viewModel: ProfileVCViewModelProtocol

  //MARK: - Initialization

  init(viewModel: ProfileVCViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setTableViewlayout()
    registerCells()
  }

  private func setupUI() {
    view.addSubview(tableView)
    tableView.backgroundColor = Colors.backgroundColor
  }

  private func registerCells() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false
    tableView.rowHeight = 60.0

    tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
    tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
  }
  
}

//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.prepareModels().count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as? ProfileTableViewCell else {
      return UITableViewCell()
    }

    cell.configure(with: viewModel.prepareModels()[indexPath.row])

    return cell
  }
}

//MARK: - TableViewDelegate

extension ProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    headerView.delegate = self
    return headerView
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UIScreen.main.bounds.height / 4.0
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
    let item = viewModel.prepareModels()[indexPath.row]
    switch item {
    case .logOut:
      presentSignInWindow()
    default:
      break
    }
  }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, ProfileHeaderViewDelegate {
  func presentImagePickerController() {
    showImagePickerController()
  }

  func dismissImagePickerController() {
    dismiss(animated: true)
  }

  private func showImagePickerController() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.originalImage] as? UIImage {
      headerView.congifure(image: image)
    }
    dismissImagePickerController()
  }
}

//MARK: - Constraints

extension ProfileViewController {

  func setTableViewlayout() {
    tableView.snp.makeConstraints({ make in
      make.edges.equalToSuperview()
    })
  }
}

extension ProfileViewController {
  private func presentSignInWindow() {
//    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//    let windows = windowScene.windows
//    if let firstWindow = windows.first {
//      let viewModel = SignInVCViewModel()
//      firstWindow.rootViewController = SignInViewController(viewModel: viewModel)
//      firstWindow.makeKeyAndVisible()
//    }
  }
}
