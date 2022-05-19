//
//  MainTabBarController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  private lazy var kStr = StringConstants()
  private lazy var kNum = NumericConstants()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
    createNavigationControllers()
  }
  
  private func createNavigationControllers() {
    let searchVC = createNavigationController(SearchViewController(), title: kStr.searchTabBarText, icon: kStr.searchIcon, iconHighlighted: nil)
    let favoritesVC = createNavigationController(FavoriteListViewController(), title: kStr.favoritesTabBarText, icon: kStr.favoriteIcon, iconHighlighted: kStr.favoriteIconHighlighted)
    viewControllers = [searchVC, favoritesVC]
  }
  
  private func configureTabBar() {
    UITabBar.appearance().tintColor = .primaryColor
    UITabBar.appearance().backgroundColor = .systemGray6
  }
  
  private func createNavigationController(_ vc: UIViewController, title: String, icon: String, iconHighlighted: String?) -> UINavigationController {
    let navVC = UINavigationController(rootViewController: vc)
    let selectedImageView = iconHighlighted == nil ? UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))! : UIImage(systemName: iconHighlighted!)!
    navVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: icon), selectedImage: selectedImageView)
    return navVC
  }
  
}
