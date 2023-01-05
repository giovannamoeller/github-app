//
//  UIViewController+.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 31/12/22.
//

import UIKit

fileprivate var loadingView: GFLoader!

extension UIViewController {
        
    func displayAlert(title: String, message: String, buttonText: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlert(title: title, message: message, buttonText: buttonText)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showLoadingView() {
        loadingView = GFLoader(frame: view.bounds)
        view.addSubview(loadingView)
    }
    
    func stopLoadingView() {
        DispatchQueue.main.async {
            loadingView.removeFromSuperview()
            loadingView = nil
        }
    }
}
