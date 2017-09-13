//
//  ReuseIdentifiable.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import Foundation

protocol ReuseIdentifiable : NSObjectProtocol {
    static var ReuseIdentifier : String { get }
}
