//
//  SourceCollectionViewCell.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

class SourceCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    static var ReuseIdentifier : String { return "SourceCollectionViewCell" }

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        nameLabel.text = ""
    }
}
