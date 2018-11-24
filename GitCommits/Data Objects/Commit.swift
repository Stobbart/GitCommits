//
//  Commit.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import Foundation

struct Commit: Decodable{
    
    let imageURL: String
    let date: String
    let authorName: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case commit = "commit"
        case author = "author"
        case name = "name"
        case date = "date"
        case title = "message"
        case imageURL = "avatar_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let commit = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .commit)
        let author = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .author)
        let commitAuthor = try commit.nestedContainer(keyedBy: CodingKeys.self, forKey: .author)
        
        imageURL = try author.decode(String.self, forKey: .imageURL)
        date = try commitAuthor.decode(String.self, forKey: .date)
        authorName = try commitAuthor.decode(String.self, forKey: .name)
        title = try commit.decode(String.self, forKey: .title)
        
    }
    
}
