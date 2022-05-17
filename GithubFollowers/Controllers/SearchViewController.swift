//
//  SearchViewController.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 13/05/22.
//

import UIKit

protocol SearchViewDelegate {
  func pushFollowersListVC()
  func onDismissKeyboard()
}

class SearchViewController: UIViewController {

  private lazy var searchView = SearchView()
  
  private var usernameIsEntered: Bool {
    return !(searchView.usernameTextField.text?.isEmpty ?? false)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureUI()
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  private func configureUI() {
    view = searchView
    searchView.usernameTextField.delegate = self
    searchView.delegate = self
    searchView.usernameTextField.text = ""
  }
  
  private func showAlert() {
    self.showAlertViewOnMainThread(title: "Enter Username", message: "Please, type an username so we know who to search for.")
  }
}

extension SearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    pushFollowersListVC()
    return true
  }
}

extension SearchViewController: SearchViewDelegate {
  func onDismissKeyboard() {
    searchView.usernameTextField.endEditing(true)
  }
  
  func pushFollowersListVC() {
    guard usernameIsEntered, let username = searchView.usernameTextField.text else {
      showAlert()
      return
    }
    let followersListVC = FollowersListViewController(username: username)
    navigationController?.pushViewController(followersListVC, animated: true)
  }
}
