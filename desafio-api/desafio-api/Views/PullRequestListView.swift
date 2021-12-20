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
                    PullRequestCellView(ownerName: pullVm.ownerName, bodyString: pullVm.body, title: pullVm.title, date: pullVm.date,ownerPictureURL: pullVm.ownerPictureURL)
            
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

struct PullRequestCellView : View{
    
    let ownerName : String
    let bodyString : String
    let title : String
    let date : Date
    let ownerPictureURL : String
    var body : some View {
        VStack(alignment: .center,spacing: 10){
            HStack(alignment: .center){
            Image("baixo_risco")
                .resizable()
                .scaledToFit()
                .frame(height:40)
                .cornerRadius(4)
                .padding(.trailing)
                VStack{
                    Text("\(ownerName)")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
                VStack(alignment: .trailing,spacing: 10){
                    Text("\(title)")
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                    Text("\(date)")
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
        }
            Text("\(bodyString)")
                .lineLimit(4)
                .minimumScaleFactor(0.5)
                .foregroundColor(.secondary)
        }
        .padding(.bottom)
        }
    }
}
