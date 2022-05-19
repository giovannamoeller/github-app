//
//  Networking.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 16/05/22.
//

import Foundation

enum ResponseError: Error {
  case invalidRequest(error: String)
  case dataNotLoaded(error: String)
  case followersNotFound(error: String)
  case genericError(error: String)
  case responseError(error: String)
}

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
  
    
  func getFollowers(for user: String, page: Int, completionHandler: @escaping ([Follower]?, ResponseError?) -> (Void)) {
    
    let endpoint = "\(basePoint)\(user)/followers?per_page=2&page=\(page)"
    
    guard let url = URL(string: endpoint) else {
      completionHandler(nil, .invalidRequest(error: "Invalid Request. Please try again."))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      
      if let _ = error {
        completionHandler(nil, .genericError(error: "Unable to complete your request. Please check your internet connection."))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completionHandler(nil, .responseError(error: "Invalid response from the server. Please try again."))
        return
      }
      
      guard let data = data else {
        completionHandler(nil, .dataNotLoaded(error: "There was an error loading the data."))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // snake-case, camelCase
        let followers = try decoder.decode([Follower].self, from: data)
        completionHandler(followers, nil)
      } catch {
        completionHandler(nil, .followersNotFound(error: "There was an error loading followers."))
      }
      
    })
    
    task.resume()
  }
  
  func getUser(for username: String, completionHandler: @escaping ([Follower]?, ResponseError?) -> Void) {
    
  }
}
