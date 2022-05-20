//
//  ImageManager.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 20/05/22.
//

import Foundation
import UIKit

class ImageManager {
  
  static let shared = ImageManager()
  private init() {}
  
  func downloadImage(from urlString: String, completionHandler: @escaping (UIImage) -> ()) {
    guard let url = URL(string: urlString) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if error != nil { return }
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        return
      }
      guard let data = data else {
        return
      }
      guard let image = UIImage(data: data) else { return }
      completionHandler(image)
    }
    task.resume()
  }
}
