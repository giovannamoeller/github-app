//
//  FollowersListView.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import UIKit

class FollowersListView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  private func configureUI() {
    backgroundColor = .backgroundColor
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
