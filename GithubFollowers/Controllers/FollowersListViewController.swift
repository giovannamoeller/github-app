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
  var pageCount: Int = 0
  var hasMoreFollowers: Bool = true
  var pageLimit: Int = 100
  
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
    self.pageCount += 1
    GithubManager.shared.getFollowers(for: username, page: pageCount) { [weak self] response in
      guard let self = self else { return }
      switch response {
      case .success(let followers):
        if followers.count < 100 {
          self.hasMoreFollowers = false
        }
        for follower in followers {
          self.followers.append(follower)
        }
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
    navigationItem.backButtonTitle = "Followers"
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let navigationController = navigationController else { return }
    let coordinator = GHFollowerDetailsCoordinator(navigationController: navigationController, follower: followers[indexPath.row])
    coordinator.start()
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let offsetY = scrollView.contentOffset.y
    let scrollViewHeight = scrollView.contentSize.height
    let viewHeight = scrollView.bounds.height
    
    print("offset \(offsetY), scroll view height \(scrollViewHeight), view height \(viewHeight)")
    
    if offsetY >= scrollViewHeight - viewHeight {
      guard hasMoreFollowers else { return }
      getFollowers()
    }
  }
}

extension FollowersListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16.0
  }
}

