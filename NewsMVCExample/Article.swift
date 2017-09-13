//
//  Article.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

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
