//
//  FollowersViewController.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 31/12/22.
//

import UIKit

class FollowersViewController: UIViewController {
    
    private let numberOfColumns: CGFloat = 3
    private var currentPage: Int = 1
    private var hasMoreFollowers: Bool = true
    
    var username: String
    
    var followers: [Follower] {
        didSet {
            updateUI()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimiumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimiumItemSpacing * (numberOfColumns - 1))
        let itemWidth = availableWidth / numberOfColumns
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }()
    
    init(username: String) {
        self.username = username
        self.followers = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFollowers()
        setLayout()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func getFollowers() {
        showLoadingView()
        Network.shared.getFollowers(for: username, page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                if followers.isEmpty {
                    self.showEmptyView(with: "This user doesn’t have any followers.")
                }
                else if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers += followers
            case .failure(let error):
                self.displayAlert(title: "Request error", message: error.rawValue, buttonText: "Try again")
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
        }
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        title = username
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension FollowersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.identifier, for: indexPath) as? GFFollowerCell {
            cell.setFollower(follower: followers[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY + height > contentHeight {
            guard hasMoreFollowers else { return }
            currentPage += 1
            getFollowers()
        }
    }
}
