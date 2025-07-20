//
//  ArticleCell.swift
//  NewsApp
//
//  Created by zaid farouqi on 20/07/2025.
//

import UIKit

class ArticleCell: UITableViewCell {
    static let identifier = "ArticleCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with article: Article) {
        textLabel?.text = article.title
        detailTextLabel?.text = article.source.name
    }
}
