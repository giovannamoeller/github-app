//
//  Network.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 02/01/23.
//

import Foundation

class Network {
    static let shared = Network()
    private let baseUrl = "https://api.github.com/users"
    private let perPageFollowers = 100
    
    private init() { }
    
    func getFollowers(for user: String, page: Int = 1, completionHandler: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        
        guard let endPoint = URL(string: "\(baseUrl)/\(user)/followers?per_page=\(perPageFollowers)&page=\(page)") else {
            completionHandler(nil, ErrorMessage.invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: endPoint, completionHandler: { (data, response, error) in
            if let _ = error {
                completionHandler(nil, ErrorMessage.unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, ErrorMessage.invalidResponse)
                return
            }
            
            guard let data = data else {
                completionHandler(nil, ErrorMessage.invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode([Follower].self, from: data)
                completionHandler(followers, nil)
            } catch {
                completionHandler(nil, ErrorMessage.invalidData)
            }
            
        })
        
        task.resume()
    }
}
