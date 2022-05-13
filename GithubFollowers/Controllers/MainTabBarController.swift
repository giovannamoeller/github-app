//
//  MainTabBarController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
    // Do any additional setup after loading the view.
  }
  
  private func configureTabBar() {
    tabBar.tintColor = .black
    viewControllers = [
      embedInNavigationController(SearchViewController(), title: "Search", icon: String.searchIcon, iconHighlighted: nil),
      embedInNavigationController(SearchViewController(), title: "Favorites", icon: String.favoriteIcon, iconHighlighted: String.favoriteIconHighlighted),
    ]
  }
  
  private func embedInNavigationController(_ vc: UIViewController, title: String, icon: String, iconHighlighted: String?) -> UINavigationController {
    
    let navVC = UINavigationController(rootViewController: vc)
    let selectedImageView = iconHighlighted == nil ? UIImage(systemName: icon, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))! : UIImage(systemName: iconHighlighted!)!
    
    navVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: icon), selectedImage: selectedImageView)
    
    return navVC
    
  }
  
}
