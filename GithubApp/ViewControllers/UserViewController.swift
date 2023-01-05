//
//  UserViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 05/01/23.
//

import UIKit

class UserViewController: UIViewController {
    
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
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissModal))
    }
    
    private func setConstraints() {
        
    }
    
    private func getUser(_ username: String) {
        
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}
