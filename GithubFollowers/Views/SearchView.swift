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
  
  lazy var usernameTextField: UITextField = {
    return TextField(placeholderText: kStr.getFollowersTextFieldPlaceholder)
  }()
  
  lazy var callToActionButton: UIButton = {
    let button = Button(color: .primaryColor, text: kStr.getFollowersButtonText)
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }()
  
  lazy var keyboardTapGesture: UITapGestureRecognizer = {
    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    return tap
  }()
  
  private func configureUI() {
    backgroundColor = .backgroundColor
  }
  
  private func addSubviews() {
    addSubview(logoImage)
    addSubview(usernameTextField)
    addSubview(callToActionButton)
    addGestureRecognizer(keyboardTapGesture)
  }
  
  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
      logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImage.widthAnchor.constraint(equalToConstant: 198.0),
      logoImage.heightAnchor.constraint(equalToConstant: 198.0),
      
      usernameTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 64.0),
      usernameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 64.0),
      usernameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -64.0),
      usernameTextField.heightAnchor.constraint(equalToConstant: 52.0),
      
      callToActionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32.0),
      callToActionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 64.0),
      callToActionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -64.0),
    ])
  }
  
  @objc private func buttonPressed() {
    delegate?.pushFollowersListVC()
  }
  
  @objc private func dismissKeyboard() {
    delegate?.onDismissKeyboard()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
