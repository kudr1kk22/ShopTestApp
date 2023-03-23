//
//  Page2ViewController.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 20.03.23.
//

import UIKit

final class Page2ViewController: UIViewController {

  //MARK: - Properties

    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

  private lazy var backButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "backButton"), for: .normal)
      button.addTarget(self, action: #selector(backButtonDidTap(_:)), for: .touchUpInside)
    return button
  }()

  private let purchaseView = PurchaseView()

  private var viewModel: Page2ViewModelProtocol

  //MARK: - Initialization

  init(viewModel: Page2ViewModelProtocol) {
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
    registerCells()
    bind()
    setConstraints()
      collectionView.allowsMultipleSelection = false
  }

  //MARK: - Binding

  private func bind() {
    viewModel.complitionHandler = {
      print("Content updated")
      self.fetchData()
    }
  }

  //MARK: - Actions

    @objc private func backButtonDidTap(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }

  //MARK: - Fetch data

  private func fetchData() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }

  //MARK: - Create CollectionViewCell

  private func registerCells() {

      let layout =  UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
          return self.createSectionLayout(section: sectionIndex)
      }

      collectionView.collectionViewLayout = layout

    collectionView.register(FullImageCell.self, forCellWithReuseIdentifier: "\(FullImageCell.self)")

    collectionView.register(SmallImagesCell.self, forCellWithReuseIdentifier: "\(SmallImagesCell.self)")

    collectionView.register(InfoCell.self, forCellWithReuseIdentifier: "\(InfoCell.self)")

    collectionView.register(ColorsCell.self, forCellWithReuseIdentifier: "\(ColorsCell.self)")

    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
  }
}

extension Page2ViewController: UIScrollViewDelegate {

}


//MARK: - UICollectionViewDataSource

extension Page2ViewController: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel.sections.count
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let type = viewModel.sections[section]
    switch type {
    case .fullImage(let viewModels):
      return viewModels.count
    case .smallImages(let viewModels):
      return viewModels.count
    case .detailsCell:
      return 1
    case .colorsCell(let viewModels):
      return viewModels.colors.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let type = viewModel.sections[indexPath.section]
    switch type {
    case .fullImage(let viewModels):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FullImageCell.self)", for: indexPath) as? FullImageCell else { return UICollectionViewCell() }
      let image = viewModels[indexPath.row]

      cell.configureCell(with: image)
      return cell

    case .smallImages(let viewModels):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SmallImagesCell.self)", for: indexPath) as? SmallImagesCell else { return UICollectionViewCell() }
      let image = viewModels[indexPath.row]

      cell.configureCell(with: image)
      return cell

    case .detailsCell(let viewModel):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(InfoCell.self)", for: indexPath) as? InfoCell else { return UICollectionViewCell() }

      cell.configure(with: viewModel)
      return cell

    case .colorsCell(let viewModel):
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ColorsCell.self)", for: indexPath) as? ColorsCell else { return UICollectionViewCell() }
      let color = viewModel.colors[indexPath.row]
      cell.configure(with: color)
      return cell


    }
  }
}

extension Page2ViewController: UICollectionViewDelegate {
}

//MARK: - Constraints

extension Page2ViewController {
  private func setConstraints() {
    view.addSubview(collectionView)
    view.addSubview(backButton)
    view.addSubview(purchaseView)

    collectionView.snp.makeConstraints { make in
        make.top.left.right.equalToSuperview()
        make.bottom.equalTo(purchaseView.snp.top)
    }

    backButton.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(90.0)
      make.left.equalToSuperview().offset(18.0)
    }

    purchaseView.snp.makeConstraints { make in
      make.height.equalTo(190.0)
      make.left.bottom.right.equalToSuperview()
    }
  }
}

extension Page2ViewController {

   func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
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

      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let horizontalGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .absolute(279.0)
        ),
        subitem: item,
        count: 1
      )

        horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
      // Section
      let section = NSCollectionLayoutSection(group: horizontalGroup)
      section.orthogonalScrollingBehavior = .continuous
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
      section.boundarySupplementaryItems = supplementaryViews

      return section
    case 1:
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.3),
        heightDimension: .absolute(50.0))
      let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitems: [item])

      group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
      section.orthogonalScrollingBehavior = .groupPagingCentered

//         PLay with some animation and scrollOffest
      section.visibleItemsInvalidationHandler = { (items, offset, environment) in
          items.forEach { item in
              let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
              let minScale: CGFloat = 0.8
              let maxScale: CGFloat = 1.0
              let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
              item.transform = CGAffineTransform(scaleX: scale, y: scale)

              if scale > minScale {
                  let indexPath = IndexPath(item: item.indexPath.row, section: 0)
                  self.collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
              }
          }
      }

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

      let group = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .absolute(120)
        ),
        subitem: item,
        count: 1
      )

      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
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

      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.1),
        heightDimension: .absolute(40.0))

      let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitem: item,
        count: 1)

      let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

      section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
      return section
    }
  }
}
