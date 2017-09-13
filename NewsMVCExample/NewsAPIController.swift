//
//  NewsAPI.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/11/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

struct NewsAPI {
    static let apiKey = "aaa4d050ddf14aa6a6ca6a1bde10c46c"
    static let `protocol` = "https"
    static let host = "newsapi.org"
    static let version = "v1"

    enum Path: CustomStringConvertible {
        case articles(source: Source, sort: Sort?)
        case sources(categories: [Category]?, languages: [Language]?, countries: [Country]?)

        var description: String {
            switch self {
            case .articles(let source, let sort):
                var theUrlString = "/\(version)/articles?source=\(source.id ?? "")&apiKey=\(apiKey)"
                if let theSort = sort?.rawValue {
                    theUrlString.append("&sortBy=\(theSort)")
                }
                return theUrlString
            case .sources(let categories, let languages, let countries):
                var theUrlString = "/v1/sources?"
                if let categories = categories {
                    theUrlString.append("categories=" + categories.reduce("", { (result:String, category:Category) -> String in
                        return result + category.rawValue + ","
                    }))
                }
                if let languages = languages {
                    theUrlString.append("languages=" + languages.reduce("", { (result:String, language:Language) -> String in
                        return result + language.rawValue + ","
                    }))
                }
                if let countries = countries {
                    theUrlString.append("countries=" + countries.reduce("", { (result:String, country:Country) -> String in
                        return result + country.rawValue + ","
                    }))
                }
                return theUrlString
            }
        }
    }

    func load<T : JSONTransformable>(_ path: Path, completionHandler: @escaping (_ response: T?, _ error: Error?) -> Void) {
        let urlString = "\(NewsAPI.`protocol`)://\(NewsAPI.host)\(path)"
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                    return
                }

                guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                    return
                }

                DispatchQueue.main.async {
                    completionHandler(T(json: json), error)
                }
            })

            DispatchQueue.global().async {
                task.resume()
            }
        } else {
            DispatchQueue.main.async {
                completionHandler(nil, nil)
            }
        }
    }
}
