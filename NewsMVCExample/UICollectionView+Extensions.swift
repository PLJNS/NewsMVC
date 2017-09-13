//
//  UICollectionView+Extensions.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T : ReuseIdentifiable>(for indexPath : IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.ReuseIdentifier, for: indexPath) as! T
    }
}
