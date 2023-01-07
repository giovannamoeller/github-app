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
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.backgroundColor = .red
        [userInfoHeaderView].forEach { view in
            stackView.addSubview(view)
        }
        return stackView
    }()
    
    private lazy var userInfoHeaderView: GFUserInfoHeaderView = {
        let view = GFUserInfoHeaderView()
        return view
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
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissModal))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            //userReposAndGistsContainerView.topAnchor.constraint(equalTo: userInfoHeaderView.bottomAnchor, constant: 32),
            //userReposAndGistsContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //userReposAndGistsContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
        userInfoHeaderView.setUserInformation(user)
        //userReposAndGistsContainerView.setUserInformation(user)
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}
