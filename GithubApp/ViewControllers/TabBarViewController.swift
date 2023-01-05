//
//  TabBarViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 30/12/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private var tag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarViews()
        setUpTabBarAndNavigationAppearance()
        // Do any additional setup after loading the view.
    }
    
    private func setUpTabBarViews() {
        let searchVC = setUpView(SearchViewController(), "Search", .search)
        let favoritesVC = setUpView(FavoritesViewController(), "Favorites", .favorites)
        viewControllers = [searchVC, favoritesVC]
    }
    
    private func setUpTabBarAndNavigationAppearance() {
        UITabBar.appearance().tintColor = .mainColor
        UINavigationBar.appearance().tintColor = .mainColor
        UITabBar.appearance().backgroundColor = .systemBackground
    }
    
    private func setUpView(_ viewController: UIViewController, _ title: String, _ tabBarSystemItem: UITabBarItem.SystemItem) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.title = title
        navVC.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarSystemItem, tag: tag)
        tag += 1
        return navVC
    }
}
