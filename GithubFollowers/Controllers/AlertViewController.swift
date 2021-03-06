//
//  AlertView.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import UIKit

class AlertViewController: UIViewController {
  
  var alertTitle: String
  var message: String
  var buttonTitle: String
  
  private lazy var alertView: UIView = {
    let view = UIView()
    view.backgroundColor = .backgroundColor
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.borderColor = UIColor.white.cgColor
    view.layer.borderWidth = 1.0
    view.layer.cornerRadius = 12.0
    return view
  }()
  
  private lazy var alertTitleLabel: UILabel = {
    let label = UILabel()
    label.text = alertTitle
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .label
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.9
    label.lineBreakMode = .byTruncatingTail // dot dot dot after the text
    return label
  }()
  
  private lazy var alertMessageLabel: UILabel = {
    let label = UILabel()
    label.text = message
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .label.withAlphaComponent(0.5)
    label.font = UIFont.preferredFont(forTextStyle: .callout)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.75
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  private lazy var alertButton: UIButton = {
    let button = Button(color: .tertiaryColor, text: "Ok")
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureAlert()
    setUpConstraints()
  }
  
  init(title: String, message: String, buttonTitle: String = "Ok") {
    self.alertTitle = title
    self.message = message
    self.buttonTitle = buttonTitle
    super.init(nibName: nil, bundle: nil)
  }
  
  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64.0),
      alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64.0),
      alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      alertView.heightAnchor.constraint(equalToConstant: 220.0),
      
      alertTitleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 32.0),
      alertTitleLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
      
      alertMessageLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: 16.0),
      alertMessageLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 16.0),
      alertMessageLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -16.0),
      
      alertButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -16),
      alertButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 16.0),
      alertButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -16.0),
    ])
  }
  
  private func configureAlert() {
    view.backgroundColor = .black.withAlphaComponent(0.75)
    view.addSubview(alertView)
    alertView.addSubview(alertTitleLabel)
    alertView.addSubview(alertMessageLabel)
    alertView.addSubview(alertButton)
  }
  
  @objc func dismissAlert() {
    dismiss(animated: true, completion: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
