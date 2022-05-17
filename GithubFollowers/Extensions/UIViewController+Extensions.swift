//
//  UIViewController+Extensions.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 17/05/22.
//

import UIKit

extension UIViewController {
  func showAlertViewOnMainThread(title: String, message: String, buttonTitle: String = "Ok") {
    DispatchQueue.main.async {
      let alert = AlertViewController(title: title, message: message, buttonTitle: buttonTitle)
      alert.modalPresentationStyle = .overFullScreen
      alert.modalTransitionStyle = .crossDissolve
      self.present(alert, animated: true, completion: nil)
    }
  }
}
