//
//  User.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 02/01/23.
//

import Foundation

struct User: Codable {
    var username: String
    var name: String?
    var bio: String?
    var location: String?
    var company: String?
    var publicRepos: Int
    var publicGists: Int
    var numberOfFollowers: Int
    var avatarUrl: String
    var htmlUrl: String
    var numberOfFollowing: Int
    var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case numberOfFollowers = "followers"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case numberOfFollowing = "following"
        case createdAt = "created_at"
    }
}
