//
//  Repository.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation

struct Repository : Decodable{
    let name : String
//    let description : String
    let ownerName : String
    let ownerPictureURL : String
    let starsCount : Int
    let forksCount : Int

}

extension Repository{

    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RepositoryKeys.self)
        let owner = try container.nestedContainer(keyedBy: RepositoryKeys.self, forKey: .owner)
        name = try container.decode(String.self, forKey: .name)
        ownerName = try owner.decode(String.self, forKey: .ownerName)
        ownerPictureURL = try owner.decode(String.self, forKey: .ownerPictureURL)
//        description = try container.decode(String.self, forKey: .desc)
        starsCount = try container.decode(Int.self, forKey: .starsCount)
        forksCount = try container.decode(Int.self, forKey: .forksCount)
    }
//
    private enum RepositoryKeys : String,CodingKey{
        case name,owner
//        case desc = "description"
        case ownerName = "login"
        case ownerPictureURL = "avatar_url"
        case starsCount = "stargazers_count"
        case forksCount = "forks_count"
    }

}
