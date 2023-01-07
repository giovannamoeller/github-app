//
//  GFTitleLabel.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 07/01/23.
//

import UIKit

class GFTitleLabel: UILabel {

    init(frame: CGRect = .zero, fontSize: CGFloat = 16) {
        super.init(frame: frame)
        font = .systemFont(ofSize: fontSize, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
