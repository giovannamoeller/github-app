//
//  GFUserInfoItemView.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 07/01/23.
//

import UIKit

enum ItemInfoType {
    case repos
    case gists
    case following
    case followers
}


class GFUserInfoItemView: UIView {

    private lazy var iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.tintColor = .label
        return imgView
    }()
    
    private lazy var titleLabel: GFTitleLabel = {
        let label = GFTitleLabel(fontSize: 18)
        return label
    }()
    
    private lazy var valueLabel: GFBodyLabel = {
        let label = GFBodyLabel()
        label.changeWeight(to: .bold)
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(itemInfoType: ItemInfoType, with value: Int) {
        switch itemInfoType {
        case .repos:
            iconImageView.image = UIImage(systemName: "folder")
            titleLabel.text = "Public Repos"
        case .gists:
            iconImageView.image = UIImage(systemName: "text.alignleft")
            titleLabel.text = "Public Gists"
        case .following:
            iconImageView.image = UIImage(systemName: "person.2")
            titleLabel.text = "Following"
        case .followers:
            iconImageView.image = UIImage(systemName: "heart")
            titleLabel.text = "Followers"
        }
        valueLabel.text = String(value)
    }
    
    private func setLayout() {
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),

            
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12)
        ])
    }

}
