//
//  SearchView.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class SearchView: UIView {
  
  private lazy var kStr = StringConstants()
  private lazy var kNum = NumericConstants()
  var delegate: SearchViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    addSubviews()
    setUpConstraints()
  }
  
  lazy var logoImage: UIImageView = {
    let imgView = UIImageView(image: UIImage(named: kStr.logoImage))
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.contentMode = .scaleAspectFit
    return imgView
  }()
  
  lazy var searchTextField: UITextField = {
    return TextField(placeholderText: kStr.getFollowersTextFieldPlaceholder)
  }()
  
  lazy var buttonGetFollowers: UIButton = {
    let button = Button(color: .primaryColor, text: kStr.getFollowersButtonText)
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }()
  
  private func configureUI() {
    backgroundColor = .backgroundColor
  }
  
  private func addSubviews() {
    addSubview(logoImage)
    addSubview(searchTextField)
    addSubview(buttonGetFollowers)
  }
  
  @objc private func buttonPressed() {
    delegate?.onButtonTapped()
  }
  
  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
      logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImage.widthAnchor.constraint(equalToConstant: 198.0),
      logoImage.heightAnchor.constraint(equalToConstant: 198.0),
      
      searchTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 64.0),
      searchTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 64.0),
      searchTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -64.0),
      searchTextField.heightAnchor.constraint(equalToConstant: 52.0),
      
      buttonGetFollowers.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32.0),
      buttonGetFollowers.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 64.0),
      buttonGetFollowers.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -64.0),
      buttonGetFollowers.heightAnchor.constraint(equalToConstant: 52.0)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
