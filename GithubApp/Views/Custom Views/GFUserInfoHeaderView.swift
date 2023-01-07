//
//  GFUserInfoHeaderView.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 05/01/23.
//

import UIKit

class GFUserInfoHeaderView: UIView {

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        [avatarImageView, textStackView].forEach { view in
            stackView.addArrangedSubview(view)
        }
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        [usernameTitleLabel, nameLabel, locationLabel].forEach { view in
            stackView.addArrangedSubview(view)
        }
        return stackView
    }()
    
    private var usernameTitleLabel = GFTitleLabel()
    private var nameLabel = GFBodyLabel(alignment: .left)
    private var locationLabel = GFBodyLabel(alignment: .left)
    private var bioLabel = GFBodyLabel(alignment: .left)
    private var avatarImageView = GFAvatarImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        addSubview(bioLabel)
    }
    
    func setUserInformation(_ user: User) {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameTitleLabel.text = user.username
        nameLabel.text = user.name ?? "Name not informed"
        locationLabel.text = user.location ?? "Location not informed"
        bioLabel.text = user.bio ?? "Bio not informed"
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 92),
            
            bioLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 32),
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bioLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
