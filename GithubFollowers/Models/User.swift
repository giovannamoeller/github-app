//
//  User.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 17/05/22.
//

import Foundation

struct User: Codable {
  let login: String
  let name: String?
  let location: String?
  let company: String?
  let avatarUrl: String
  let bio: String?
  let followers: Int
  let following: Int
  let publicRepos: Int
  let publicGists: Int
  let htmlUrl: String
  let createdAt: String
}
