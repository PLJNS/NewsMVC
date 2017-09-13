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
        if let categoryRawValue = jsonDictionary?["category"] as? String {
            category = Category(rawValue: categoryRawValue)
        } else {
            category = nil
        }
        if let languageRawValue = jsonDictionary?["language"] as? String {
            language = Language(rawValue: languageRawValue)
        } else {
            language = nil
        }
        if let countryRawValue = jsonDictionary?["country"] as? String {
            country = Country(rawValue: countryRawValue)
        } else {
            country = nil
        }
        if let sortBysAvailableJSONArray = jsonDictionary?["sortBysAvailable"] as? [String] {
            var aSortBysAvailable: [Sort] = []
            for sortByAvailableRawValue in sortBysAvailableJSONArray {
                if let sort = Sort(rawValue: sortByAvailableRawValue) {
                    aSortBysAvailable.append(sort)
                }
            }
            sortBysAvailable = aSortBysAvailable
        } else {
            sortBysAvailable = nil
        }
    }
}
