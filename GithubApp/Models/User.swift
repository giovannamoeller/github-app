//
//  User.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 02/01/23.
//

import Foundation

struct User {
    var username: String
    var name: String
    var bio: String
    var location: String?
    var company: String?
    var numberOfFollowers: Int
    var avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case numberOfFollowers = "followers"
        case avatarURL = "avatar_url"
    }
}
