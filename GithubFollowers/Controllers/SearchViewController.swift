//
//  SearchViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

protocol SearchViewDelegate {
  func onButtonTapped()
  func onDismissKeyboard()
}

class SearchViewController: UIViewController {

  private lazy var searchView = SearchView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureUI()
    navigationController?.isNavigationBarHidden = true
  }
  
  private func configureUI() {
    view = searchView
    searchView.usernameTextField.delegate = self
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
  func onDismissKeyboard() {
    searchView.usernameTextField.endEditing(true)
  }
  
  func onButtonTapped() {
    guard let username = searchView.usernameTextField.text else { return }
    print(username)
  }
}
