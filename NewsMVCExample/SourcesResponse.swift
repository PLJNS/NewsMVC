//
//  SourcesResponse.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

struct SourcesResponse: JSONTransformable {
    let status: String?
    let sources: [Source]?

    init(json: Any) {
        let jsonDictionary = json as? [String : Any]
        status = jsonDictionary?["status"] as? String
        if let sourcesJSONArray = jsonDictionary?["sources"] as? [[String: Any]] {
            var aSources: [Source] = []
            for sourceJSONDictionary in sourcesJSONArray {
                aSources.append(Source(json: sourceJSONDictionary))
            }
            sources = aSources
        } else {
            sources = nil
        }
    }
}
