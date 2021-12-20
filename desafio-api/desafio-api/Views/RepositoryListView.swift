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
                    VStack(spacing:10){
                        HStack(spacing: 5){
                        Image("baixo_risco")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .cornerRadius(4)
                        VStack(spacing: 5){
                            Text("\(reposVM.ownerName)")
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text("\(reposVM.name)")
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                        }
                            VStack(alignment: .trailing){
                            HStack(spacing: 5){
                                Image(systemName: "star.fill")
                                Text("\(reposVM.startCount)")
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.secondary)
                            }
                            HStack(spacing: 5){
                                Image("fork")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                Text("\(reposVM.forksCount)")
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                        
                    }
                   
                Text("Esse é um texto de exemplo que vai funcionar como uma descricao para essa view aqui so pra testar ate quanto essa descricao vai pra poder saber o tamanho maximo dela ")
                            .lineLimit(2)
                            .minimumScaleFactor(0.6)
                            .foregroundColor(.secondary)
                    }
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




//List(self.repositoryViewModel.repositories,id: \.id){reposVM in
//    HStack{
//        VStack{
//            Text("Foto do autor")
//        }
//        VStack{
//            Text("Nome do repositorio")
//            Text("\(reposVM.name)")
//        }
//        VStack{
//            Text("Numero de Forks")
//            Text("\(reposVM.forksCount)")
//
//        }
//        VStack{
//            Text("Numero de Estrelas")
//            Text("\(reposVM.startCount)")
//        }
//        //Text(reposVM.description)
//    }
//}
