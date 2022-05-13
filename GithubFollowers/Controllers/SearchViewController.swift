//
//  SearchViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

protocol SearchViewDelegate {
  func onButtonTapped()
}

class SearchViewController: UIViewController {

  private lazy var searchView = SearchView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  private func configureUI() {
    view = searchView
    searchView.searchTextField.delegate = self
    searchView.delegate = self
  }

}

extension SearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

extension SearchViewController: SearchViewDelegate {
  func onButtonTapped() {
    guard let username = searchView.searchTextField.text else { return }
    print(username)
  }
}
