//
//  GFTextField.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 23/12/22.
//

import UIKit

class GFTextField: UITextField {

    init(_ text: String) {
        super.init(frame: .zero)
        placeholder = text
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52.0)
        ])
    }

}
