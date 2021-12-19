//
//  PullRequestListView.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import SwiftUI

struct PullRequestListView: View {
    @ObservedObject private var pullRequestVM : PullRequestListViewModel
    var repositoryName : String
    var ownerName : String
    
    init(repositoryName: String,ownerName : String){
        self.repositoryName = repositoryName
        self.ownerName = ownerName
        pullRequestVM = PullRequestListViewModel()
    }
        
    var body: some View {
        NavigationView{
            List(self.pullRequestVM.pullRequests,id: \.id){pullVm in
                NavigationLink(destination: PullRequestPageView(url: pullVm.url)){
                VStack(alignment: .center,spacing: 10){
                    HStack(alignment: .center){
                    Image("baixo_risco")
                        .resizable()
                        .scaledToFit()
                        .frame(height:40)
                        .cornerRadius(4)
                        .padding(.trailing)
                        VStack{
                            Text("\(pullVm.ownerName)")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                        VStack(alignment: .trailing,spacing: 10){
                            Text("\(pullVm.title)")
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            Text("\(pullVm.date)")
                            .foregroundColor(.secondary)
                    }
                }
                    Text("\(pullVm.body)")
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom)
                }
            
        .navigationBarTitle(Text("Pull Requests"))
            }
        }.onAppear{
            self.pullRequestVM.fetchPullRequests(repositoryName: repositoryName, ownerName: ownerName)
        }
    }
}

struct PullRequestListView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestListView(repositoryName: "zziz",  ownerName: "pwc")
    }
}
