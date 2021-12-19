//
//  APIProtocol.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation

protocol GithubAPI{
    var basePath : String {get}
    var token : String {get}
    
    func getRepositoriesURLRequest(pageIndex : Int) -> URLRequest
    func getPullrequestsURLRequest(repositoryName : String, ownerName : String) -> URLRequest
    func getURLRequest(path : String) -> URLRequest
}
