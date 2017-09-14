//
//  SourcesResponse.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

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
