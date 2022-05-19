//
//  ResponseError.swift
//  GithubFollowers
//
//  Created by Giovanna Moeller on 19/05/22.
//

import Foundation

enum ResponseError: String, Error {
  case invalidRequest = "This usernamed created an invalid request. Please try again."
  case unabledToComplete = "Unable to complete your request. Please check your internet connection."
  case invalidResponse = "Invalid response from the server. Please try again with another username."
  case invalidData = "The data received from the server was invalid. Please try again."
}
