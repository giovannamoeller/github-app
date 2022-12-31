//
//  GFButton.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 23/12/22.
//

import UIKit

class GFButton: UIButton {

    init(_ title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 12.0
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52.0)
        ])
    }
    
    func setBackgroundColor(to color: UIColor) {
        backgroundColor = color
    }

}
