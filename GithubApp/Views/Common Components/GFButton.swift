//
//  GFButton.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 23/12/22.
//

import UIKit

class GFButton: UIButton {
    
    private var title: String
    private var bgColor: UIColor

    init(_ title: String, _ bgColor: UIColor) {
        self.title = title
        self.bgColor = bgColor
        super.init(frame: .zero)
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        setTitle(title, for: .normal)
        self.backgroundColor = bgColor
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 12.0
    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52.0)
        ])
    }

}
