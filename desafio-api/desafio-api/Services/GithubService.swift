//
//  GithubService.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation
//import UIKit
import Combine

class GithubService{
    
    func getRepositories(pageNumber : Int = 1) -> AnyPublisher<[Repository],Error>{
        
        return URLSession.shared.dataTaskPublisher(for: APISettings.getRepositoriesURLRequest(pageIndex: pageNumber))
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Repositories.self, decoder: JSONDecoder())
            .map{$0.repos}
            .eraseToAnyPublisher()
    }
    func getPullRequests(repositoryName: String,ownerName : String) -> AnyPublisher<[PullRequest],Error>{
        print(APISettings.getPullrequestsURLRequest(repositoryName: repositoryName, ownerName: ownerName))
        return URLSession.shared.dataTaskPublisher(for: APISettings.getPullrequestsURLRequest(repositoryName: repositoryName, ownerName: ownerName))
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [PullRequest].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
