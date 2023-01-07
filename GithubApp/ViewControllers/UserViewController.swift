//
//  UserViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 05/01/23.
//

import UIKit

class UserViewController: UIViewController {
    
    private lazy var userInfoHeaderView: GFUserInfoHeaderView = {
        return GFUserInfoHeaderView()
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
        view.addSubview(userInfoHeaderView)
        userInfoHeaderView.backgroundColor = .systemPink
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissModal))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userInfoHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userInfoHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
