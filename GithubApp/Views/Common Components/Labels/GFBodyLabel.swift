//
//  GFBodyLabel.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 07/01/23.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .darkGray
        numberOfLines = 0
        font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    func changeWeight(to weight: UIFont.Weight) {
        font = .systemFont(ofSize: 16, weight: weight)
    }

}
