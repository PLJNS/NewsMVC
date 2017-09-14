//
//  Source.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

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
