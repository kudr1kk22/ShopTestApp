//
//  TabBarViewController.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

final class TabBarViewController: UITabBarController {

  //MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    changeRadiusOfTabBar()
    createTabBar()
    addSelectedCircle()

  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    changeHeightOfTabbar()
  }

//MARK: - Configure tabbar

  private func createTabBar() {

    tabBar.tintColor = Colors.tabBarItem

    let page1VC = TabBarAssembler.makePage1ViewController()
    page1VC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "homeIcon"), tag: 0)
    let page1VCnavigationController = UINavigationController(rootViewController: page1VC)


    let secondVC = UIViewController()
    secondVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "bockmarksIcon"), tag: 1)

    let thirdVC = UIViewController()
    thirdVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "cartIcon"), tag: 2)

    let fourthVC = UIViewController()
    fourthVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "chatIcon"), tag: 3)

    let profileVC = TabBarAssembler.makeProfileViewController()
    profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profileIcon"), tag: 4)

    let viewControllers = [page1VCnavigationController, secondVC, thirdVC, fourthVC, profileVC]
    self.setViewControllers(viewControllers, animated: false)
  }
}

//MARK: - TabBar Appearance

extension TabBarViewController {
  private func addSelectedCircle() {
    let circleImage = UIImage.circle(diameter: 40, color: Colors.tabBarSelectedItem)
    tabBar.selectionIndicatorImage = circleImage
  }

  private func changeRadiusOfTabBar() {
    self.tabBar.backgroundColor = .white
    self.tabBar.layer.masksToBounds = true
    self.tabBar.isTranslucent = true
    self.tabBar.layer.cornerRadius = 30
    self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }

 private func changeHeightOfTabbar() {
    if UIDevice().userInterfaceIdiom == .phone {
      var tabFrame = tabBar.frame
      tabFrame.size.height = 100
      tabFrame.origin.y = view.frame.size.height - 100
      tabBar.frame = tabFrame
    }
  }
}



