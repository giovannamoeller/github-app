//
//  Networking.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import Foundation

struct CodableResponse {
  func convertJSONToFollowers(data: Data) -> [Follower] {
    return (try? JSONDecoder().decode([Follower].self, from: data)) ?? []
  }
  func convertJSONToUser(data: Data) -> User? {
    return (try? JSONDecoder().decode(User.self, from: data))
  }
}

class GithubManager {
  
  static let shared = GithubManager()
  private let basePoint = "https://api.github.com/users/"

  private init() {}
  
    
  func getFollowers(for user: String, page: Int, completionHandler: @escaping (Result<[Follower], ResponseError>) -> (Void)) {
    
    let endpoint = "\(basePoint)\(user)/followers?per_page=100&page=\(page)"
    
    guard let url = URL(string: endpoint) else {
      completionHandler(.failure(.invalidRequest))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      
      if let _ = error {
        completionHandler(.failure(.unabledToComplete))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completionHandler(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completionHandler(.failure(.invalidData))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // snake-case, camelCase
        let followers = try decoder.decode([Follower].self, from: data)
        completionHandler(.success(followers))
      } catch {
        completionHandler(.failure(.invalidData))
      }
      
    })
    
    task.resume()
  }
  
  func getUser(for username: String, completionHandler: @escaping ([Follower]?, ResponseError?) -> Void) {
    
  }
}
