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
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissAlert))
        return tap
    }()
    
    private lazy var backgroundView: UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        return bgView
    }()
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 16.0
        container.layer.borderWidth = 2.0
        container.layer.borderColor = UIColor.systemGray.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        return container
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = alertTitle
        titleLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = alertMessage
        messageLabel.font = .preferredFont(forTextStyle: .body)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    
    private lazy var button: GFButton = {
        let button = GFButton(alertButtonText, .errorColor)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
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
    
    @objc private func dismissAlert() {
        dismiss(animated: true)
    }
    
    private func setLayout() {
        view.addSubview(backgroundView)
        backgroundView.addGestureRecognizer(tapGesture)
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(button)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 230.0),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64.0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64.0),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
        
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16.0),
            button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
        ])
        
    }
    
}
