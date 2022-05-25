//
//  GHFollowerDetailsCoordinator.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 23/05/22.
//

import Foundation
import UIKit

class GHFollowerDetailsCoordinator: Coordinator {  
  
  var navigationController: UINavigationController
  
  private var follower: Follower
  
  init(navigationController: UINavigationController, follower: Follower) {
    self.navigationController = navigationController
    self.follower = follower
  }
  
  func start() {
    let vc = FollowerDetailsViewController(follower: follower)
    navigationController.pushViewController(vc, animated: true)
  }
}
