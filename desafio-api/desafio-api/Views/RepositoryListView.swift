//
//  RepositoryListView.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import SwiftUI

struct RepositoryListView: View {
    
    @ObservedObject private var repositoryViewModel = RepositoryListViewModel()
    var body: some View {
        NavigationView{
            List(self.repositoryViewModel.repositories,id: \.id
            ){ reposVM in
                NavigationLink(destination: PullRequestListView(repositoryName: reposVM.name, ownerName: reposVM.ownerName), label: {
                    RepositoryViewCell(ownerName: reposVM.ownerName, name: reposVM.name, starCount: reposVM.startCount, forksCount: reposVM.forksCount, description: reposVM.description,ownerPictureURL: reposVM.ownerPictureURL)
                }).buttonStyle(PlainButtonStyle())
           
                    .onAppear{
                        self.repositoryViewModel.fetchRepositories(currentItem: reposVM)
                }
            .navigationBarTitle(Text("Repositorios Swift"))
            }
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}

struct RepositoryViewCell : View {
    let ownerName : String
    let name : String
    let starCount : Int
    let forksCount : Int
    let description : String?
    let ownerPictureURL : String
    var body: some View {
        VStack(spacing:10){
            HStack(spacing: 5){
            Image("baixo_risco")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .cornerRadius(4)
            VStack(spacing: 5){
                Text("\(ownerName)")
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                Text("\(name)")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
            }
                VStack(alignment: .trailing){
                HStack(spacing: 5){
                    Image(systemName: "star.fill")
                    Text("\(starCount)")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.secondary)
                }
                HStack(spacing: 5){
                    Image("fork")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                    Text("\(forksCount)")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.secondary)
                }
                
            }
            
        }
       
            Text("\(description ?? "")")
                .lineLimit(2)
                .minimumScaleFactor(0.6)
                .foregroundColor(.secondary)
        }
    }
}
