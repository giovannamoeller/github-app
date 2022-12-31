//
//  UIViewController+.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 31/12/22.
//

import UIKit

extension UIViewController {
    func displayAlert(title: String, message: String, buttonText: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlert(title: title, message: message, buttonText: buttonText)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
