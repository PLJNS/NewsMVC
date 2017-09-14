//
//  Category.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

enum Status: String {
    case ok = "ok"
    case error = "error"
}

enum Category: String {
    case business = "business"
    case entertainment = "entertainment"
    case gaming = "gaming"
    case general = "general"
    case music = "music"
    case politics = "politics"
    case science = "science-and-nature"
    case sport = "sport"
    case technology = "technology"
}

enum Country: String {
    case australia = "au"
    case germany = "de"
    case england = "gb"
    case india = "in"
    case italy = "it"
    case usa = "us"
}

enum Language: String {
    case english = "en"
    case german = "de"
    case french = "fr"
}

enum Sort: String {
    case top = "top"
    case latest = "latest"
    case popular = "popular"
}
