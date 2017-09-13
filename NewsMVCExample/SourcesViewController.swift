//
//  ViewController.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/11/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit

class SourcesViewController: UIViewController {

    let api = NewsAPI()
    var sources: [Source] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        api.load(.sources(categories: nil, languages: nil, countries: nil)) { [weak self] (response: SourcesResponse?, error:Error?) in
            self?.sources = response?.sources ?? []
            self?.collectionView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case Segue.sourcesToArticles.rawValue:
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
        let cell : SourceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.iconImageView.setIconImage(from: sources[indexPath.row].url)
        cell.nameLabel.text = sources[indexPath.row].name
        return cell
    }
}

extension SourcesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellsPerLineFloat: CGFloat = 2
        let itemWidthWithoutConsideringInteritemSpace = collectionViewFlowLayout.collectionViewWidthWithoutInsets / numberOfCellsPerLineFloat
        let numberOfInteritemSpaces = (numberOfCellsPerLineFloat - 1)
        let amountOfInteritemSpacePerCell = (collectionViewFlowLayout.minimumInteritemSpacing / numberOfCellsPerLineFloat)
        let itemWidth = itemWidthWithoutConsideringInteritemSpace - (numberOfInteritemSpaces * amountOfInteritemSpacePerCell)
        return CGSize(width: itemWidth, height: 208)
    }
}
