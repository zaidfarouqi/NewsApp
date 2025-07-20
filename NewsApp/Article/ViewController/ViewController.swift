//
//  ViewController.swift
//  NewsApp
//
//  Created by zaid farouqi on 20/07/2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Headlines"
        view.backgroundColor = .systemBackground

        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.identifier)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)

        view.addSubview(tableView)
        fetchArticles()
    }

    @objc func refresh() {
        fetchArticles()
    }

    func fetchArticles() {
        NewsService.shared.fetchArticles { [weak self] articles in
            DispatchQueue.main.async {
                self?.articles = articles
                self?.tableView.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else {
            return UITableViewCell()
        }
        cell.configure(with: articles[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let alert = UIAlertController(title: article.title, message: "\(article.author ?? "")\n\n\(article.description ?? "")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

