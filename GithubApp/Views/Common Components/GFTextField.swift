//
//  GFTextField.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 23/12/22.
//

import UIKit

class GFTextField: UITextField {

    private var placeHolderText: String
    
    init(_ text: String) {
        self.placeHolderText = text
        super.init(frame: .zero)
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        placeholder = placeHolderText
        layer.borderWidth = 1.0
        layer.borderColor = .borderColor
        layer.cornerRadius = 12.0
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12.0
        textColor = .label
        tintColor = .label
        autocorrectionType = .no
        returnKeyType = .go
        autocapitalizationType = .none
    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52.0)
        ])
    }

}
