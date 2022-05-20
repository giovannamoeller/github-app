//
//  FollowerViewCell.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 19/05/22.
//

import UIKit

class FollowerCell: UICollectionViewCell {
  
  static let identifier = "FollowerCell"
  
  let image: String = ""
  
  func set(follower: Follower) {
    usernameLabel.text = follower.login
    ImageManager.shared.downloadImage(from: follower.avatarUrl, completionHandler: { [weak self] image in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.imageView.image = image
      }
    })
  }
  
  private lazy var imageView: UIImageView = {
    let imgView = UIImageView(image: UIImage(named: "default-avatar"))
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.layer.cornerRadius = 16.0
    imgView.contentMode = .scaleAspectFill
    imgView.clipsToBounds = true
    return imgView
  }()
  
  private lazy var usernameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private func configureUI() {
  }
  
  private func addSubviews() {
    addSubview(imageView)
    addSubview(usernameLabel)
  }
  
  private func setUpConstraints() {
    
    let padding: CGFloat = 8.0
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
      
      usernameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
      usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      usernameLabel.heightAnchor.constraint(equalToConstant: padding * 3),
    ])
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    addSubviews()
    setUpConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
