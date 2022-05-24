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
  private let cache = NSCache<NSString, UIImage>()
  private init() {}
  
  func downloadImage(from urlString: String, completionHandler: @escaping (UIImage) -> ()) {
    if let image = checkImageInCache(urlString: urlString) {
      completionHandler(image)
      return
    }
    guard let url = URL(string: urlString) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let self = self else { return }
      if error != nil { return }
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        return
      }
      guard let data = data else {
        return
      }
      guard let image = UIImage(data: data) else { return }
      self.setImageToCache(image: image, urlString: urlString)
      completionHandler(image)
    }
    task.resume()
  }
  
  func checkImageInCache(urlString: String) -> UIImage? {
    let cacheKey = NSString(string: urlString)
    guard let image = cache.object(forKey: cacheKey) else { return nil }
    return image
  }
  
  func setImageToCache(image: UIImage, urlString: String) {
    let cacheKey = NSString(string: urlString)
    cache.setObject(image, forKey: cacheKey)
  }
}
