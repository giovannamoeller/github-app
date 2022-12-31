//
//  GFAlert.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 31/12/22.
//

import UIKit

class GFAlert: UIViewController {
    
    var alertTitle: String
    var alertMessage: String
    var alertButtonText: String
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 16.0
        container.layer.borderWidth = 2.0
        container.layer.borderColor = UIColor.red.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemGreen
        return container
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = alertTitle
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        return titleLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = alertMessage
        messageLabel.font = .preferredFont(forTextStyle: .body)
        return messageLabel
    }()
    
    private lazy var button: GFButton = {
        let button = GFButton(alertButtonText, .errorColor)
        return button
    }()
    
    init(title: String, message: String, buttonText: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.alertButtonText = buttonText
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(button)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 220.0),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
        
        ])
        
    }
    
}
