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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDefaultImage() {
        guard let image = UIImage(named: "avatar-placeholder") else { return }
        self.image = image
        self.contentMode = .scaleAspectFit
    }
    
    func downloadImage(from url: String) {
        Network.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }

    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }

}
