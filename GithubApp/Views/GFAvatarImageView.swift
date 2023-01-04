//
//  GFAvatarImageView.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 04/01/23.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        setDefaultImage()
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDefaultImage() {
        guard let image = UIImage(named: "avatar-placeholder") else { return }
        self.image = image
    }
    
    func downloadImage(from url: String) {
        
    }

    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }

}
