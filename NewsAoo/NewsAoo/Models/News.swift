//
//  News.swift
//  NewsAoo
//
//  Created by Tushar Vijayvargiya on 27/05/21.
//

import Foundation
struct News:Decodable
{
    let author: String?
    let title:String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsEnvelope:Decodable {
    let status:String
    let totalResults: Int
    let articles: [News]
}
    

