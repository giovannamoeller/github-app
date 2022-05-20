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
  var collectionView: UICollectionView
  
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
    self.collectionView = followersListView.collectionView
    super.init(nibName: nil, bundle: nil)
  }
  
  private func getFollowers() {
    GithubManager.shared.getFollowers(for: username, page: 1) { [weak self] response in
      guard let self = self else { return }
      switch response {
      case .success(let followers):
        self.followers = followers
      case .failure(let error):
        self.showAlertViewOnMainThread(title: "Error", message: error.rawValue)
      }
    }
  }
  
  private func updateFollowers() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  private func configureNavigationBar() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func configureUI() {
    view = followersListView
    collectionView.delegate = self
    collectionView.dataSource = self
    title = username
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension FollowersListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return followers.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as? FollowerCell
    cell?.set(follower: followers[indexPath.row])
    return cell ?? UICollectionViewCell()
  }
}

extension FollowersListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16.0
  }
}
