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

  private let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.makeRounded()
    return imageView
  }()




  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    setTableViewlayout()
    registerCells()
  }

  private func setupUI() {
    view.addSubview(tableView)
  }

  private func registerCells() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false

    tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
    tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
  }
  
}

//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as? ProfileTableViewCell else {
      return UITableViewCell()
    }
   
    cell.configure()

    return cell
  }
}

extension ProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = ProfileHeaderView()
    return headerView
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UIScreen.main.bounds.height / 4.0
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
