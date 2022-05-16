//
//  FollowersListViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import UIKit

class FollowersListViewController: UIViewController {
  
  var username: String
  var followersListView = FollowersListView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  init(username: String) {
    self.username = username
    super.init(nibName: nil, bundle: nil)
  }
  
  private func configureUI() {
    view = followersListView
    title = username
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.isNavigationBarHidden = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
