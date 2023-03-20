//
//  Page1ViewController.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

final class Page1ViewController: UIViewController {

  //MARK: - Properties

  private var customNavigationBar = CustomNavigationBar()

  private var collectionView: UICollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
      return Page1ViewController.createSectionLayout(section: sectionIndex)
    }
  )

  private var viewModel: Page1ViewModelProtocol

  //MARK: - Initialization

  init(viewModel: Page1ViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - ViewDidLoad

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setNavBar()
    bind()
    registerCells()
    setConstraints()
  }

  //MARK: - Binding

  private func bind() {
    viewModel.complitionHandler = {
      print("Content updated")
      self.fetchData()
    }
  }

  private func setNavBar() {

    self.navigationController?.navigationBar.isHidden = true

  }

  //MARK: - Create CollectionViewCell

  private func registerCells() {

    collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "\(CategoryCell.self)")

    collectionView.register(LatestCell.self, forCellWithReuseIdentifier: "\(LatestCell.self)")

    collectionView.register(FlashSaleCell.self, forCellWithReuseIdentifier: "\(FlashSaleCell.self)")

    collectionView.register(HeaderTitleViewCell.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderTitleViewCell.self)")

    collectionView.register(CustomSearchBar.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(CustomSearchBar.self)")

    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
  }
  
}

extension Page1ViewController {
  private func fetchData() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
}

//MARK: - UICollectionViewDataSource

extension Page1ViewController: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel.sections.count
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let type = viewModel.sections[section]
    switch type {
    case .category(let viewModels):
      return viewModels.count
    case .latest(let viewModels):
      return viewModels.count
    case .flashSale(let viewModels):
      return viewModels.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let type = viewModel.sections[indexPath.section]
    switch type {
    case .category(let viewModels):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCell.self)", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
      let viewModel = viewModels[indexPath.row]
      cell.configure(model: viewModel)
      return cell


    case .latest(let viewModels):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LatestCell.self)", for: indexPath) as? LatestCell else { return UICollectionViewCell() }
      let viewModel = viewModels[indexPath.row]
      cell.configure(with: viewModel)
      return cell

    case .flashSale(let viewModels):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FlashSaleCell.self)", for: indexPath) as? FlashSaleCell else { return UICollectionViewCell() }
      let viewModel = viewModels[indexPath.row]
      cell.configure(with: viewModel)
      return cell
    }



  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard let header = collectionView.dequeueReusableSupplementaryView(
      ofKind: kind,
      withReuseIdentifier: "\(HeaderTitleViewCell.self)",
      for: indexPath) as? HeaderTitleViewCell,kind == UICollectionView.elementKindSectionHeader else {
      return UICollectionReusableView()
    }

    let section = indexPath.section
    if kind == UICollectionView.elementKindSectionHeader && section == 0 {
      let searchBar = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CustomSearchBar.self)", for: indexPath)
      return searchBar
    }
    let title = viewModel.sections[section].title
    let viewAll = viewModel.sections[section].viewAll
    header.configure(with: title, viewAll: viewAll)
    return header
  }

}

//MARK: - UICollectionViewDelegate

extension Page1ViewController: UICollectionViewDelegate {

}

//MARK: - Constraints

extension Page1ViewController {
  private func setConstraints() {
    view.addSubview(collectionView)
    view.addSubview(customNavigationBar)

    customNavigationBar.snp.makeConstraints { make in
      make.height.equalTo(100.0)
      make.top.left.right.equalToSuperview()
    }

    collectionView.snp.makeConstraints { make in
      make.top.equalTo(customNavigationBar.snp.bottom)
      make.left.bottom.right.equalToSuperview()
    }
  }
}

extension Page1ViewController {

  static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
    let supplementaryViews = [
      NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .absolute(50)
        ),
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top
      )
    ]

    switch section {
    case 0:
      // Item
      let item = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0)
        )
      )

      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 21, bottom: 2, trailing: 2)

      let horizontalGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.17),
          heightDimension: .absolute(70.0)
        ),
        subitem: item,
        count: 1
      )
      // Section
      let section = NSCollectionLayoutSection(group: horizontalGroup)
      section.orthogonalScrollingBehavior = .paging
      section.boundarySupplementaryItems = supplementaryViews
      return section
    case 1:
      // Item
      let item = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0)
        )
      )

      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let horizontalGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .absolute(135),
          heightDimension: .absolute(170)
        ),
        subitem: item,
        count: 1
      )
      horizontalGroup.interItemSpacing = .fixed(12.0)

      // Section
      let section = NSCollectionLayoutSection(group: horizontalGroup)
      section.orthogonalScrollingBehavior = .continuous
      section.boundarySupplementaryItems = supplementaryViews

      return section
    case 2:
      // Item
      let item = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0)
        )
      )

      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let horizontalGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .absolute(200),
          heightDimension: .absolute(256)
        ),
        subitem: item,
        count: 1
      )
      horizontalGroup.interItemSpacing = .fixed(12.0)

      // Section
      let section = NSCollectionLayoutSection(group: horizontalGroup)
      section.orthogonalScrollingBehavior = .continuous
      section.boundarySupplementaryItems = supplementaryViews

      return section
    default:
      // Item
      let item = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0)
        )
      )

      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let group = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .absolute(390)
        ),
        subitem: item,
        count: 1
      )
      let section = NSCollectionLayoutSection(group: group)
      section.boundarySupplementaryItems = supplementaryViews
      return section
    }
  }
}
