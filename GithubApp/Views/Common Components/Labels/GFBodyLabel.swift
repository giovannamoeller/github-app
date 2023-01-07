//
//  GFBodyLabel.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 07/01/23.
//

import UIKit

class GFBodyLabel: UILabel {

    init(frame: CGRect = .zero, fontSize: CGFloat = 16, alignment: NSTextAlignment = .center) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        numberOfLines = 0
        textAlignment = alignment
        font = .systemFont(ofSize: fontSize, weight: .regular)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeWeight(to weight: UIFont.Weight) {
        font = .systemFont(ofSize: 16, weight: weight)
    }

}
