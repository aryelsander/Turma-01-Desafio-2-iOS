//
//  WebView.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 19/12/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable{
    var url : String
    
    func makeUIView(context: Context) -> some UIView {
        guard let url = URL(string: self.url) else{ fatalError("Invalid url")}
        let request = URLRequest(url: url)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
