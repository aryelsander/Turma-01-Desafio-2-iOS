//
//  PullRequestListViewModel.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation
import Combine

class PullRequestListViewModel : ObservableObject{
    
   @Published var pullRequests = [PullRequestViewModel]()
    let apiSettings = APISettings()
    private var cancellable : AnyCancellable?
 
    
    func fetchPullRequests(repositoryName : String,ownerName : String) {
        self.cancellable = GithubService().getPullRequests(repositoryName: repositoryName, ownerName: ownerName).map{repos in
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return repos.map{PullRequestViewModel(url: $0.url,ownerName: $0.ownerName,ownerPictureURL: $0.ownerPictureURL,title: $0.title,date: dateFormatter.date(from: $0.date)!,body: $0.body)}
        }.sink(receiveCompletion: {a in
            print("Chamou os Pull Requests de \(repositoryName)")
        }, receiveValue: {repositoryViewModels in
            self.pullRequests = repositoryViewModels
        })
          
    }
}


struct PullRequestViewModel : Identifiable{
    let id = UUID()
    let url : String
    let ownerName : String
    let ownerPictureURL : String
    let title : String
    let date : Date
    let body : String
}
