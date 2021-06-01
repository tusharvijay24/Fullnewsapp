//
//  NetworkManager.swift
//  NewsAoo
//
//  Created by Tushar Vijayvargiya on 27/05/21.
//

import Foundation
class NetworkManager
{
    let imageCache = NSCache<NSString,NSData>()
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrlString = "https://newsapi.org/v2/"
    private let INtopHeadline = "top-headlines?country=in"
    
    func getNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "\(baseUrlString)\(INtopHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { Data, URLResponse, Error in
            guard Error == nil,let data = Data else {
                completion(nil)
                return
            }
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
        }
        .resume()
    }
    
    func getimage(urlstring:String, completion: @escaping (Data?) -> Void) {
        guard  let url = URL(string: urlstring) else {
            completion(nil)
            return
        }
        if let cacheImage = imageCache.object(forKey: NSString(string: urlstring))
        {
            completion(cacheImage as Data)
        }else{
            URLSession.shared.dataTask(with: url) { Data, URLResponse, Error in
                guard Error == nil,let data = Data else {
                    completion(nil)
                    return
            }
                self.imageCache.setObject(data as NSData , forKey: NSString(string: urlstring))
                completion(data)
            }.resume()
        }
    }
}
