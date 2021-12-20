//
//  RepositoryListViewModel.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation
import Combine

class RepositoryListViewModel : ObservableObject,RandomAccessCollection{
    
    private var nextPageToLoad = 1
    private var currentlyLoading = false
    typealias Element = RepositoryViewModel
   @Published var repositories = [RepositoryViewModel]()
    private var cancellable : AnyCancellable?
    private var doneLoading = false
    
    init(){
        fetchRepositories()
    }
    
    subscript(position: Int) -> RepositoryViewModel {
        return repositories[position]
    }
    
    var startIndex: Int {repositories.startIndex}
    var endIndex: Int {repositories.endIndex}

    func shouldLoadMoreData(currentItem : RepositoryViewModel? = nil) -> Bool{
        if currentlyLoading || doneLoading{
            return false
        }
        guard let currentItem = currentItem else {
            return true
        }

        for n in (repositories.count - 4)...(repositories.count-1){
            if n >= 0 && currentItem.id == repositories[n].id{
                return true
            }
        }
        return false
    }
    
    func fetchRepositories(currentItem : RepositoryViewModel? = nil) {
         if !shouldLoadMoreData(currentItem: currentItem){
             return
         }
         currentlyLoading = true
         
        self.cancellable = GithubService().getRepositories(pageNumber: nextPageToLoad).map{repos in
            repos.map{RepositoryViewModel(name: $0.name,startCount: $0.starsCount,forksCount:$0.forksCount,ownerName: $0.ownerName,ownerPictureURL: $0.ownerPictureURL)}
        }.sink(receiveCompletion: {repo in
            print("Chamou mais Repositorios")
            self.nextPageToLoad += 1
            self.currentlyLoading = false
            
        }, receiveValue: {repositoryViewModels in
            self.repositories.append(contentsOf: repositoryViewModels)
            self.doneLoading = (repositoryViewModels.count == 0)
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
