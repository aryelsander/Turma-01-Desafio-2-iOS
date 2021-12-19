//
//  Repositories.swift
//  desafio-api
//
//  Created by ARYEL SANDER DOS SANTOS on 17/12/21.
//

import Foundation

struct Repositories : Decodable{
    let repos : [Repository]
}

extension Repositories{
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Repositorieskeys.self)
        repos = try container.decode([Repository].self, forKey: .repos)
    }
    private enum Repositorieskeys : String,CodingKey{
        case repos = "items"
    }
}
