//
//  NewsViewModel.swift
//  NewsAoo
//
//  Created by Tushar Vijayvargiya on 27/05/21.
//

import Foundation
struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    var title: String {
        return news.title ?? ""
    }
    var description: String {
        return news.description ?? ""
    }
    var url: String {
        return news.url ?? ""
    }
    var urltoImage: String {
        return news.urlToImage ?? "https://p.kindpng.com/picc/s/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
}
