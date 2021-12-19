//
//  PullRequestView.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import SwiftUI
import Combine


struct PullRequestView: View {

    @ObservedObject private var pullRequestVM = PullRequestListViewModel()
    var body: some View {
        NavigationView{
            List(self.pullRequestVM.pullRequests) {prVM in
                Text("\(prVM.url)")
            }
        }
    }
}

struct PullRequestView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestView()
    }
}
