//
//  PullRequest.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation
import SwiftUI

struct PullRequest : Decodable{
    let url : String
    let ownerName : String
    let ownerPictureURL : String
    let title : String
    let date : String
    let body : String
}

extension PullRequest{
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PullRequestKeys.self)
        let owner = try container.nestedContainer(keyedBy: PullRequestKeys.self, forKey: .user)
        url = try container.decode(String.self, forKey: .url)
        ownerName = try owner.decode(String.self, forKey: .ownerName)
        ownerPictureURL = try owner.decode(String.self, forKey: .ownerPictureURL)
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(String.self, forKey: .date)
        body = try container.decode(String.self, forKey: .body)
    }

    private enum PullRequestKeys : String,CodingKey{
        case user,title,body
        case url = "html_url"
        case ownerName = "login"
        case ownerPictureURL = "avatar_url"
        case date = "created_at"
    }
}
