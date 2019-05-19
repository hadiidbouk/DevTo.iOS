//
//  FeedViewModel.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/15/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import RxSwift

class FeedViewModel {
    
    let articles: Observable<[Article]>
    
    init() {
       
        var articles = [Article]()
        
        do {
            if let path = Bundle(for: type(of: self)).path(forResource: "articles", ofType: "json") {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                articles = try jsonDecoder.decode([Article].self, from: data)
            }
        } catch {
            fatalError()
        }
        self.articles = Observable.just(articles)
    }
}
