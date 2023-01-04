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
        //setConstraints()
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
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }

    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.0
        clipsToBounds = true
    }

}
