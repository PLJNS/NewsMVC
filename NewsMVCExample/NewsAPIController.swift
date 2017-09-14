//
//  NewsAPIController.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/11/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

/*
 To declare that your models can be initialized from JSON,
 declare conformance to this protocol.
 */
protocol JSONTransformable {
    init(json: Any)
}

struct NewsAPIController {
    static let apiKey = "aaa4d050ddf14aa6a6ca6a1bde10c46c"
    static let `protocol` = "https"
    static let host = "newsapi.org"
    static let version = "v1"

    enum Path: CustomStringConvertible {
        case articles(source: Source)
        case sources

        var description: String {
            switch self {
            case .articles(let source):
                return "/\(version)/articles?source=\(source.id ?? "")&apiKey=\(apiKey)"
            case .sources:
                return "/v1/sources"
            }
        }
    }

    static func load<T : JSONTransformable>(_ path: Path, completionHandler: @escaping (_ response: T?, _ error: Error?) -> Void) {
        let urlString = "\(NewsAPIController.`protocol`)://\(NewsAPIController.host)\(path)"
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let data = data else {
                    DispatchQueue.main.async { completionHandler(nil, error) }
                    return
                }

                guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                    DispatchQueue.main.async { completionHandler(nil, error) }
                    return
                }

                DispatchQueue.main.async { completionHandler(T(json: json), error) }
            })

            DispatchQueue.global().async { task.resume() }
        } else {
            DispatchQueue.main.async { completionHandler(nil, nil) }
        }
    }
}
