//
//  ArticlesViewController.swift
//  NewsMVCExample
//
//  Created by Paul Jones on 9/11/17.
//  Copyright © 2017 Paul Jones. All rights reserved.
//

import UIKit
import SafariServices

class ArticlesViewController: UIViewController {
    var source: SourcesResponse.Source!
    var articles: [ArticlesResponse.Article] = []
    let apiController = NewsAPIController()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        title = source.name

        apiController.load(.articles(source: source)) { [weak self] (response:ArticlesResponse?, error:Error?) in
            self?.articles = response?.articles ?? []
            self?.tableView.reloadData()
        }
    }
}

extension ArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.authorLabel.text = articles[indexPath.row].author
        cell.previewImageView.setImage(from: articles[indexPath.row].urlToImage)
        cell.theTitleLabel.text = articles[indexPath.row].title
        return cell
    }
}

extension ArticlesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        if let url = URL(string: article.url ?? "") {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
}
