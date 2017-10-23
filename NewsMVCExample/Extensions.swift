//
//  UICollectionViewFlowLayoutExntensions.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

extension UIImageView {
    public func setImage(from urlString: String?) {
        image = nil
        if let url = URL(string: urlString ?? "") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage(data: data)
                }
            }
            DispatchQueue.global().async {
                task.resume()
            }
        }
    }
}

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
