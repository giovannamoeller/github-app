//
//  UserViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 05/01/23.
//

import UIKit

class UserViewController: UIViewController {
    
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
    
    private lazy var usernameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var avatarImageView: GFAvatarImageView = {
        let imgView = GFAvatarImageView()
        return imgView
    }()
        
    init(follower: Follower) {
        super.init(nibName: nil, bundle: nil)
        getUser(follower.username)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }
    
    private func setLayout() {
        view.addSubview(mainStackView)
        view.addSubview(bioLabel)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissModal))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 92),
            
            bioLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 32),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func getUser(_ username: String) {
        showLoadingView()
        Network.shared.getUser(for: username) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.displayUserInfo(user)
                }
            case .failure(let error):
                self.displayAlert(title: "Request error", message: error.rawValue, buttonText: "Try again")
                return
            }
        }
    }
    
    private func displayUserInfo(_ user: User) {
        print(user)
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameTitleLabel.text = user.username
        nameLabel.text = user.name ?? "Name not informed"
        locationLabel.text = user.location ?? "Location not informed"
        bioLabel.text = user.bio ?? "Bio not informed"
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}
