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
    // Do any additional setup after loading the view.
  }
  
  private func configureTabBar() {
    tabBar.tintColor = .black
    viewControllers = [
      embedInNavigationController(SearchViewController(), title: "Search", icon: kStr.searchIcon, iconHighlighted: nil),
      embedInNavigationController(SearchViewController(), title: "Favorites", icon: kStr.favoriteIcon, iconHighlighted: kStr.favoriteIconHighlighted),
    ]
  }
  
  private func embedInNavigationController(_ vc: UIViewController, title: String, icon: String, iconHighlighted: String?) -> UINavigationController {
    let navVC = UINavigationController(rootViewController: vc)
    let selectedImageView = iconHighlighted == nil ? UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))! : UIImage(systemName: iconHighlighted!)!
    navVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: icon), selectedImage: selectedImageView)
    return navVC
  }
  
}
