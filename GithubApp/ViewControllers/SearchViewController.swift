//
//  SearchViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 22/12/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    var isUsernameEntered: Bool {
        return !(textField.text?.isEmpty ?? true)
    }
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gh-logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
    }()
    
    private lazy var textField: GFTextField = {
        let textField = GFTextField("Enter username")
        textField.delegate = self
        return textField
    }()
    
    private lazy var button: GFButton = {
        let button = GFButton("Get Followers", .mainColor)
        button.addTarget(self, action: #selector(goToFollowersVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc private func goToFollowersVC() {
        guard isUsernameEntered else {
            displayAlert(title: "Empty Username", message: "Please enter an username so we can search for someone.", buttonText: "Ok")
            return
        }
        let username = textField.text ?? String()
        let followersVC = FollowersViewController(username: username)
        navigationController?.pushViewController(followersVC, animated: true)
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addGestureRecognizer(tapGesture)
        view.addSubview(logoImageView)
        view.addSubview(textField)
        view.addSubview(button)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 128),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 190.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 190.0),
            
            textField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 96.0),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 64.0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
        ])
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        goToFollowersVC()
        return true
    }
}

