//
//  UIViewController+.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 31/12/22.
//

import UIKit

fileprivate var loadingView: GFLoader!
fileprivate var emptyView: GFEmptyView!


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
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            loadingView.removeFromSuperview()
            loadingView = nil
        }
    }
    
    func showEmptyView(with message: String) {
        DispatchQueue.main.async {
            emptyView = GFEmptyView(frame: self.view.bounds)
            emptyView.setMessage(message)
            self.view.addSubview(emptyView)
        }
    }
    
}
