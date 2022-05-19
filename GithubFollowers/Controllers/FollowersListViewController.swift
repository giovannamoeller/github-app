//
//  FollowersListViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import UIKit

class FollowersListViewController: UIViewController {
  
  var username: String
  var followers: [Follower] = [] {
    didSet {
      updateFollowers()
    }
  }
  var followersListView = FollowersListView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    getFollowers()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNavigationBar()
  }
  
  init(username: String) {
    self.username = username
    super.init(nibName: nil, bundle: nil)
  }
  
  private func getFollowers() {
    GithubManager.shared.getFollowers(for: username, page: 1) { followers, error in
      
      guard let followers = followers else {
        guard let error = error else {
          return
        }
        self.showAlertViewOnMainThread(title: "Error", message: error.rawValue)
        return
      }
      self.followers = followers
    }
  }
  
  private func updateFollowers() {
    print(followers)
  }
  
  private func configureNavigationBar() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func configureUI() {
    view = followersListView
    followersListView.collectionView.delegate = self
    followersListView.collectionView.dataSource = self
    title = username
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension FollowersListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .red
    return cell
  }
}

extension FollowersListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 32.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
  }
}
