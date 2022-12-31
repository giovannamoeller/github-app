//
//  SearchViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 22/12/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gh-logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textField = GFTextField("Enter Username")
    
    private lazy var button = GFButton("Get Followers", .mainColor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(textField)
        view.addSubview(button)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
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

