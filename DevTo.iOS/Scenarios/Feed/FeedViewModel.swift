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

//MARK: - ArticleDto
extension FeedViewModel {
    
    func transform(article: Article) -> ArticleDto {
        
        let title = article.title
        let reactions = "\(article.positiveReactionsCount)"
        let comments = "\(article.commentsCount)"
        let tags = article.tagList.map { "#\($0)" }.joined(separator: " ")
        
        let name = article.user.name
        let format = DateFormatter()
        format.dateFormat = "MMMM dd"
        let formattedDate = format.string(from: article.publishedTimestamp)
        let nameAndDate = "\(name)・\(formattedDate)"
        
        var timeAgoString = ""
        
        if let timeAgo =  article.publishedTimestamp.getDayIntervalTimeAgo(){
            timeAgoString = "(\(timeAgo))"
        }
       
        let profileImageUrl = URL(string: article.user.profileImage90Url)
        
        return ArticleDto(userProfilePictureUrl: profileImageUrl!,
                          title: title,
                          nameAndDate: nameAndDate,
                          timeAgo: timeAgoString,
                          tags: tags,
                          reactions: reactions,
                          comments: comments)
    }
}
