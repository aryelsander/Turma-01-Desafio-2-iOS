//
//  APISettings.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation

struct APISettings{
    
    static let basePath = "https://api.github.com"
    static let repositoriesPath = "/search/repositories?q=language:Swift&sort=stars&page="
    static let token = "token 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"
    
    static func getURLRequest(path: String) -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: path)!)
        urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
        return urlRequest
    }
    
    static func getRepositoriesURLRequest(pageIndex: Int) -> URLRequest {
        return getURLRequest(path: "\(basePath)\(repositoriesPath)\(pageIndex)")
    }
    
    static func getPullrequestsURLRequest(repositoryName: String, ownerName: String) -> URLRequest {
        return getURLRequest(path: "\(basePath)/repos/\(repositoryName)/\(ownerName)/pulls")
    }
}
