//
//  GFFollowerCell.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 04/01/23.
//

import UIKit

class GFFollowerCell: UICollectionViewCell {
    
    static let identifier = "followerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func setFollower(follower: Follower) {
        usernameLabel.text = follower.username
        avatarImageView.downloadImage(from: follower.avatarURL)
    }
    
    private func setLayout() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
