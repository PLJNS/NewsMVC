//
//  Category.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: Status?

    struct Article: Codable {
        let author: String?
        let description: String?
        let title: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
    }

    let articles: [Article]?
    let code: String?
    let message: String?
}

struct SourcesResponse: Codable {
    let status: Status?

    struct Source: Codable {
        let id: String?
        let name: String?
        let description: String?
        let url: String?
        let category: Category?
        let language: Language?
        let country: Country?
        let sortBysAvailable: [Sort]?
    }

    let sources: [Source]?
    let code: String?
    let message: String?
}


enum Status: String, Codable {
    case ok = "ok"
    case error = "error"
}

enum Category: String, Codable {
    case business = "business"
    case entertainment = "entertainment"
    case gaming = "gaming"
    case general = "general"
    case music = "music"
    case politics = "politics"
    case science = "science-and-nature"
    case sport = "sport"
    case technology = "technology"
}

enum Country: String, Codable {
    case australia = "au"
    case germany = "de"
    case england = "gb"
    case india = "in"
    case italy = "it"
    case usa = "us"
}

enum Language: String, Codable {
    case english = "en"
    case german = "de"
    case french = "fr"
}

enum Sort: String, Codable {
    case top = "top"
    case latest = "latest"
    case popular = "popular"
}
