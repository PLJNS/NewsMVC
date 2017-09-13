//
//  UICollectionViewFlowLayoutExntensions.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout {
    var collectionViewWidthWithoutInsets : CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.frame.width - collectionViewInsetLeftAndRightTotal
    }

    var collectionViewInsetLeftAndRightTotal : CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.contentInset.left + collectionView.contentInset.right + sectionInset.left + sectionInset.right
    }
}
