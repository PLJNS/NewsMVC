//
//  ArticlesResponse.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

struct ArticlesResponse: JSONTransformable {
    let status: String?
    let articles: [Article]?

    init(json: Any) {
        let jsonDictionary = json as? [String : Any]
        status = jsonDictionary?["status"] as? String
        if let articlesJSONArray = jsonDictionary?["articles"] as? [[String: Any]] {
            var anArticles: [Article] = []
            for sourceJSONDictionary in articlesJSONArray {
                anArticles.append(Article(json: sourceJSONDictionary))
            }
            articles = anArticles
        } else {
            articles = nil
        }
    }
}
