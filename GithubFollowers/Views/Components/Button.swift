//
//  Button.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import UIKit

class Button: UIButton {
  
  private var color: UIColor
  private var text: String
  
  private lazy var kNum = NumericConstants()
  
  init(color: UIColor, text: String) {
    self.color = color
    self.text = text
    super.init(frame: .zero)
    configureButton()
  }
  
  private func configureButton() {
    translatesAutoresizingMaskIntoConstraints = false
    setTitle(text, for: .normal)
    backgroundColor = color
    layer.cornerRadius = kNum.cornerRadius
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    heightAnchor.constraint(equalToConstant: 48.0).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
