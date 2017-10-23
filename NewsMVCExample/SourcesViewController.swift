//
//  ViewController.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/11/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

class SourcesViewController: UIViewController {
    var sources: [Source] = []
    let apiController = NewsAPIController()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        apiController.load(.sources) { [weak self] (response: SourcesResponse?, error:Error?) in
            self?.sources = response?.sources ?? []
            self?.collectionView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "SourcesViewController_to_ArticlesViewController":
            let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first ?? IndexPath(item: 0, section: 0)
            let destination = segue.destination as! ArticlesViewController
            destination.source = sources[selectedIndexPath.row]
        default:
            ()
        }
    }
}

extension SourcesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sources.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SourceCollectionViewCell", for: indexPath) as! SourceCollectionViewCell
        if let siteUrlString = sources[indexPath.row].url {
            let imgUrlString = "https://icons.better-idea.org/icon?url=\(siteUrlString)&size=70..120..200"
            cell.iconImageView.setImage(from: imgUrlString)
        }
        cell.nameLabel.text = sources[indexPath.row].name
        return cell
    }
}

extension SourcesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellsPerLine: CGFloat = 2
        let itemWidthWithoutConsideringInteritemSpace = collectionViewFlowLayout.collectionViewWidthWithoutInsets / numberOfCellsPerLine
        let amountOfInteritemSpacePerCell = (collectionViewFlowLayout.minimumInteritemSpacing / numberOfCellsPerLine)
        let itemWidth = itemWidthWithoutConsideringInteritemSpace - ((numberOfCellsPerLine - 1) * amountOfInteritemSpacePerCell)
        return CGSize(width: itemWidth, height: 208)
    }
}
