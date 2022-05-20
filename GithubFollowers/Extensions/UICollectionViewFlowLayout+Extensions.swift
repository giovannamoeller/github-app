//
//  UICollectionViewFlowLayout+Extensions.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 20/05/22.
//

import UIKit

extension UICollectionViewFlowLayout {
  static var followersFlowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    let numberOfItemsPerRow = 3
    let totalWidth = UIScreen.main.bounds.width
    let padding = 8.0
    let availableWidth = totalWidth - (padding * Double((numberOfItemsPerRow + 2)))
    let itemWidth = availableWidth / Double(numberOfItemsPerRow)
    layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
    layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 48)
    return layout
  }()
}
