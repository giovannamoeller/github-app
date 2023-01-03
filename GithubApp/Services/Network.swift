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
    
    func getFollowers(for user: String, page: Int = 1, completionHandler: @escaping ([Follower]?, String?) -> Void) {
        
        guard let endPoint = URL(string: "\(baseUrl)/\(user)/followers?per_page=\(perPageFollowers)&page=\(page)") else {
            completionHandler(nil, "The username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: endPoint, completionHandler: { (data, response, error) in
            if let _ = error {
                completionHandler(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completionHandler(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode([Follower].self, from: data)
                completionHandler(followers, nil)
            } catch {
                completionHandler(nil, "The data received from the server was invalid. Please try again.")
            }
            
        })
        
        task.resume()
    }
}
