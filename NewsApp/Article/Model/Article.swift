//
//  Article.swift
//  NewsApp
//
//  Created by zaid farouqi on 20/07/2025.
//

struct Article: Codable {
    let title: String
    let source: Source
    let urlToImage: String?
    let author: String?
    let description: String?
}

struct Source: Codable {
    let name: String
}

struct NewsResponse: Codable {
    let articles: [Article]
}
