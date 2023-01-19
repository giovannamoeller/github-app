//
//  UserViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 05/01/23.
//

import UIKit

class UserViewController: UIViewController {
    
    private var userInfoHeaderView = GFUserInfoHeaderView()
    
    private var userReposAndGistsContainerView = GFUserInfoContainerView(infoType: .reposAndGists)
    private var reposContainer = GFUserInfoItemView()
    private var gistsContainer = GFUserInfoItemView()
    private var githubProfileButton = GFButton("Github Profile", .systemPurple)
    
    private var userFollowingAndFollowersContainerView = GFUserInfoContainerView(infoType: .followingAndFollowers)
    private var followingContainer = GFUserInfoItemView()
    private var followersContainer = GFUserInfoItemView()
    private var getFollowersButton = GFButton("Get Followers", .mainColor)
    
    
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
        
        view.addSubview(userReposAndGistsContainerView)
        userReposAndGistsContainerView.addInfoView(view: reposContainer)
        userReposAndGistsContainerView.addInfoView(view: gistsContainer)
        userReposAndGistsContainerView.addButton(button: githubProfileButton)
        userReposAndGistsContainerView.delegate = self
        
        view.addSubview(userFollowingAndFollowersContainerView)
        userFollowingAndFollowersContainerView.addInfoView(view: followingContainer)
        userFollowingAndFollowersContainerView.addInfoView(view: followersContainer)
        userFollowingAndFollowersContainerView.addButton(button: getFollowersButton)
        userFollowingAndFollowersContainerView.delegate = self
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissModal))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userInfoHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userInfoHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            userReposAndGistsContainerView.topAnchor.constraint(equalTo: userInfoHeaderView.bottomAnchor, constant: 32),
            userReposAndGistsContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userReposAndGistsContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userFollowingAndFollowersContainerView.topAnchor.constraint(equalTo: userReposAndGistsContainerView.bottomAnchor, constant: 32),
            userFollowingAndFollowersContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userFollowingAndFollowersContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
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
        
        reposContainer.set(itemInfoType: .repos, with: user.publicRepos)
        gistsContainer.set(itemInfoType: .gists, with: user.publicGists)
        
        followersContainer.set(itemInfoType: .followers, with: user.numberOfFollowers)
        followingContainer.set(itemInfoType: .following, with: user.numberOfFollowing)
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}

extension UserViewController: GFUserInfoContainerProtocol {
    func didTapGithubProfile() {
        print("github")
    }
    
    func didTapGetFollowers() {
        print("followers")
    }
}
