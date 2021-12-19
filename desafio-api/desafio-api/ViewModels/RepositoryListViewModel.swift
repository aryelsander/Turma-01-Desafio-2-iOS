//
//  RepositoryListViewModel.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation
import Combine

class RepositoryListViewModel : ObservableObject{
    
   @Published var repositories = [RepositoryViewModel]()
    private var cancellable : AnyCancellable?
    
    init(){
        fetchRepositories()
    }
    
    private func fetchRepositories() {
        self.cancellable = GithubService().getRepositories(pageNumber: 1).map{repos in
            repos.map{RepositoryViewModel(name: $0.name,startCount: $0.starsCount,forksCount:$0.forksCount,ownerName: $0.ownerName,ownerPictureURL: $0.ownerPictureURL)}
        }.sink(receiveCompletion: {repo in
            print("Chamou os Repositorios")
        }, receiveValue: {repositoryViewModels in
            self.repositories = repositoryViewModels
        })
          
    }
}


struct RepositoryViewModel : Identifiable{
    let id = UUID()
    let name : String
    let startCount : Int
    let forksCount : Int
    let ownerName : String
    let ownerPictureURL : String
   // let description : String
}
