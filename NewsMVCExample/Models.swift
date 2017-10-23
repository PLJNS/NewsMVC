//
//  Category.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

protocol JSONTransformable {
    init(json: Any)
}

struct ArticlesResponse: JSONTransformable {
    let status: Status?
    let articles: [Article]?
    let code: String?
    let message: String?

    init(json: Any) {
        let jsonDictionary = json as? [String : Any]
        status = Status(rawValue: jsonDictionary?["status"] as? String)
        code = jsonDictionary?["code"] as? String
        message = jsonDictionary?["message"] as? String
        articles = (jsonDictionary?["articles"] as? [Any])?.map({ (element:Any) -> Article in
            return Article(json: element)
        })
    }
}

struct Article: JSONTransformable {
    let author: String?
    let description: String?
    let title: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?

    init(json: Any) {
        let jsonDictionary = json as? [String : Any]
        author = jsonDictionary?["author"] as? String
        description = jsonDictionary?["description"] as? String
        title = jsonDictionary?["title"] as? String
        url = jsonDictionary?["url"] as? String
        urlToImage = jsonDictionary?["urlToImage"] as? String
        publishedAt = jsonDictionary?["publishedAt"] as? String
    }
}

struct Source: JSONTransformable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: Category?
    let language: Language?
    let country: Country?
    let sortBysAvailable: [Sort]?

    init(json: Any) {
        let jsonDictionary = json as? [String : Any]
        id = jsonDictionary?["id"] as? String
        name = jsonDictionary?["name"] as? String
        description = jsonDictionary?["description"] as? String
        url = jsonDictionary?["url"] as? String
        category = Category(rawValue: jsonDictionary?["category"] as? String)
        language = Language(rawValue: jsonDictionary?["language"] as? String)
        country = Country(rawValue: jsonDictionary?["country"] as? String)
        sortBysAvailable = nil /* not used in this exercise */
    }
}

struct SourcesResponse: JSONTransformable {
    let status: Status?
    let sources: [Source]?
    let code: String?
    let message: String?

    init(json: Any) {
        let jsonDictionary = json as? [String : Any]
        status = Status(rawValue: jsonDictionary?["status"] as? String)
        code = jsonDictionary?["code"] as? String
        message = jsonDictionary?["message"] as? String
        sources = (jsonDictionary?["sources"] as? [Any])?.map({ (element:Any) -> Source in
            return Source(json: element)
        })
    }
}

enum Status: String {
    case ok = "ok"
    case error = "error"
}

enum Category: String {
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

enum Country: String {
    case australia = "au"
    case germany = "de"
    case england = "gb"
    case india = "in"
    case italy = "it"
    case usa = "us"
}

enum Language: String {
    case english = "en"
    case german = "de"
    case french = "fr"
}

enum Sort: String {
    case top = "top"
    case latest = "latest"
    case popular = "popular"
}
