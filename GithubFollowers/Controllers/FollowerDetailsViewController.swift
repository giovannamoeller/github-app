//
//  FollowerDetailsViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 23/05/22.
//

import UIKit

class FollowerDetailsViewController: UIViewController {
  
  private var follower: Follower
  private var user: User? {
    didSet {
      updateUser()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getUser()
    configureUI()
    addSubviews()
    setUpConstraints()
  }
  
  private func getUser() {
    GithubManager.shared.getUser(for: follower.login, completionHandler: { result in
      switch result {
      case .success(let user):
        self.user = user
      case .failure(let error):
        self.showAlertViewOnMainThread(title: "Erro!", message: error.rawValue)
      }
    })
  }
  
  func updateUser() {
    guard let user = user else { return }
    DispatchQueue.main.async {
      self.loginTextLabel.text = user.login
      self.nameTextLabel.text = user.name
      self.locationTextLabel.text = user.location ?? "Location not available"
      self.bioTextLabel.text = user.bio ?? "No bio available"
    }
  }
  
  private lazy var loginTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    return label
  }()
  
  private lazy var nameTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .body)
    return label
  }()
  
  private lazy var locationTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .caption1)
    return label
  }()
  
  private lazy var bioTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .caption1)
    return label
  }()
  
  private lazy var usernameImageView: UIImageView = {
    let imageView = UIImageView()
    ImageManager.shared.downloadImage(from: follower.avatarUrl) { image in
      DispatchQueue.main.async {
        imageView.image = image
      }
    }
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 16.0
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private func addSubviews() {
    view.addSubview(loginTextLabel)
    view.addSubview(usernameImageView)
    view.addSubview(nameTextLabel)
    view.addSubview(locationTextLabel)
    view.addSubview(bioTextLabel)
  }
  
  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      
      usernameImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      usernameImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
      usernameImageView.widthAnchor.constraint(equalToConstant: 112.0),
      usernameImageView.heightAnchor.constraint(equalToConstant: 112.0),
      
      loginTextLabel.leadingAnchor.constraint(equalTo: usernameImageView.trailingAnchor, constant: 16.0),
      loginTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      nameTextLabel.leadingAnchor.constraint(equalTo: usernameImageView.trailingAnchor, constant: 16.0),
      nameTextLabel.topAnchor.constraint(equalTo: loginTextLabel.bottomAnchor, constant: 8.0),
      
      locationTextLabel.leadingAnchor.constraint(equalTo: usernameImageView.trailingAnchor, constant: 16.0),
      locationTextLabel.topAnchor.constraint(equalTo: nameTextLabel.bottomAnchor, constant: 8.0),
      
      bioTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
      bioTextLabel.topAnchor.constraint(equalTo: usernameImageView.bottomAnchor, constant: 16.0),

    ])
  }
  
  private func configureUI() {
    view.backgroundColor = .backgroundColor
  }
  
  init(follower: Follower) {
    self.follower = follower
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
