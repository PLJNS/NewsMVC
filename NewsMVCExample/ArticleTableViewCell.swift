//
//  ArticleTableViewCell.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/13/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var theTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        previewImageView.image = nil
        authorLabel.text = ""
        theTitleLabel.text = ""
    }
}
