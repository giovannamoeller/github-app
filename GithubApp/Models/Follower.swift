//
//  Follower.swift
//  GithubApp
//
//  Created by Giovanna Moeller on 03/01/23.
//

import Foundation

struct Follower {
    var username: String
    var avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case avatarURL = "avatar_url"
    }
}
