//
//  ArticlesResponse.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

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
