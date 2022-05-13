//
//  FavoriteListViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class FavoriteListViewController: UIViewController {
  
  private lazy var favoriteListView = FavoriteListView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = favoriteListView
  }
  
}
