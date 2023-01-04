//
//  GFFollowerCell.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 04/01/23.
//

import UIKit

class GFFollowerCell: UICollectionViewCell {
    
    static let identifier = "followerCell"
    
    private lazy var avatarImageView: GFAvatarImageView = {
        let imgView = GFAvatarImageView()
        return imgView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
}
