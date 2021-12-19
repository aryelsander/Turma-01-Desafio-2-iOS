//
//  PullRequestPageView.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 19/12/21.
//

import SwiftUI

struct PullRequestPageView: View {
    let url : String
    var body: some View {
        WebView(url: url)
    }
}

struct PullRequestPageView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestPageView(url : "")
    }
}
