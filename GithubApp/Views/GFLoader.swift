//
//  GFLoader.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 04/01/23.
//

import UIKit

class GFLoader: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.75)
    }
    
}
