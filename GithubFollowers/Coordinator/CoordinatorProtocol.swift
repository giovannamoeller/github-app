//
//  CoordinatorProtocol.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 23/05/22.
//

import Foundation
import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
