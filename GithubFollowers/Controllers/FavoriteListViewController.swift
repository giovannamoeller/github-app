//
//  FavoriteListViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class FavoriteListViewController: UIViewController {
  
  private lazy var favoriteListView = FavoriteListView()
  private lazy var kStr = StringConstants()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  private func configureUI() {
    view = favoriteListView
    title = kStr.favoritesTabBarText
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
}
