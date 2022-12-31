//
//  TabBarViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 30/12/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarViews()
        setUpTabBarAppearance()
        // Do any additional setup after loading the view.
    }
    
    private func setUpTabBarViews() {
        let searchVC = setUpView(SearchViewController(), "Search", "magnifyingglass", "magnifyingglass")
        let favoritesVC = setUpView(FavoritesViewController(), "Favorites", "star", "star.fill")
        viewControllers = [searchVC, favoritesVC]
    }
    
    private func setUpTabBarAppearance() {
        UITabBar.appearance().tintColor = .mainColor
    }
    
    private func setUpView(_ viewController: UIViewController, _ title: String, _ iconName: String, _ iconSelectedName: String) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.title = title
        navVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: iconName), selectedImage: UIImage(systemName: iconSelectedName))
        return navVC
    }
}
