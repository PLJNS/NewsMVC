//
//  NewsAPIController.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/11/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

struct NewsAPIController {
    static let apiKey = "aaa4d050ddf14aa6a6ca6a1bde10c46c"
    static let scheme = "https"
    static let host = "newsapi.org"
    static let version = "v1"

    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)

    enum Path {
        case articles(source: Source)
        case sources

        var url: URL? {
            switch self {
            case .articles(let source):

                let queryParameters = [
                    "apiKey" : apiKey,
                    "source" : source.id
                ]

                var components = URLComponents()
                components.scheme = scheme
                components.host = host
                components.path = "/\(version)/articles"
                components.queryItems = queryParameters.map({
                    return URLQueryItem(name: $0, value: $1)
                })

                return components.url
            case .sources:
                var components = URLComponents()
                components.scheme = scheme
                components.host = host
                components.path = "/v1/sources"

                return components.url
            }
        }
    }

    @discardableResult func load<T : JSONTransformable>(_ path: Path, completionHandler: @escaping (_ response: T?, _ error: Error?) -> Void) -> URLSessionTask? {
        if let url = path.url {
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

            return task
        }

        DispatchQueue.main.async { completionHandler(nil, nil) }
        return nil
    }
}
