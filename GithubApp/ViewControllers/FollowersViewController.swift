//
//  FollowersViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 31/12/22.
//

import UIKit

class FollowersViewController: UIViewController {
    
    var username: String
    var followers: [Follower] {
        didSet {
            updateUI()
        }
    }
    
    init(username: String) {
        self.username = username
        self.followers = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFollowers()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        title = username
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getFollowers() {
        Network.shared.getFollowers(for: username) { result in
            
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.displayAlert(title: "Request error", message: error.rawValue, buttonText: "Try again")
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
        }
    }
    
    private func updateUI() {
        
    }
}
