//
//  FavoriteListView.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class FavoriteListView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    addSubviews()
    setUpConstraints()
  }
  
  private func configureUI() {
    backgroundColor = .backgroundColor
  }
  
  private func addSubviews() {
  }
  
  private func setUpConstraints() {
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
