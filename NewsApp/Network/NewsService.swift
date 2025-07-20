//
//  NewsService.swift
//  NewsApp
//
//  Created by zaid farouqi on 20/07/2025.
//

import Foundation

class NewsService {
    static let shared = NewsService()

    func fetchArticles(completion: @escaping ([Article]) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0956ef9aac654d8db000c78b9f498df9"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            do {
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(response.articles)
            } catch {
                completion([])
            }
        }.resume()
    }
}
