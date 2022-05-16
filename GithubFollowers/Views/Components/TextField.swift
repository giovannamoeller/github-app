//
//  TextField.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import UIKit

class TextField: UITextField {
  
  private var placeholderText: String
  
  private lazy var kNum = NumericConstants()
  
  init(placeholderText: String) {
    self.placeholderText = placeholderText
    super.init(frame: .zero)
    configureTextField()
  }
  
  private func configureTextField() {
    translatesAutoresizingMaskIntoConstraints = false
    placeholder = placeholderText
    layer.borderColor = UIColor.systemGray4.cgColor
    layer.borderWidth = kNum.borderWidth
    layer.cornerRadius = kNum.cornerRadius
    textAlignment = .center
    autocapitalizationType = .none
    autocorrectionType = .no
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumFontSize = kNum.minimiumFontSize
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
