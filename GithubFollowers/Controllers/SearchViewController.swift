//
//  SearchViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

class SearchViewController: UIViewController {

  private lazy var searchView = SearchView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = searchView
  }

}

