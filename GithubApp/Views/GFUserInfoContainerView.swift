//
//  GFUserInfoContainerView.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 07/01/23.
//

import UIKit

protocol GFUserInfoContainerProtocol {
    func didTapGithubProfile()
    func didTapGetFollowers()
}

class GFUserInfoContainerView: UIView {
    
    var delegate: GFUserInfoContainerProtocol?
    private var infoType: ItemType

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
        
    init(frame: CGRect = .zero, infoType: ItemType) {
        self.infoType = infoType
        super.init(frame: frame)
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        backgroundColor = .lightGray.withAlphaComponent(0.2)
        layer.cornerRadius = 16.0
    }
    
    func addInfoView(view: UIView) {
        mainStackView.addArrangedSubview(view)
    }
    
    func addButton(button: UIButton) {
        addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 78),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    @objc func buttonTapped() {
        switch infoType {
        case .reposAndGists:
            delegate?.didTapGithubProfile()
        case .followingAndFollowers:
            delegate?.didTapGetFollowers()
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

}

