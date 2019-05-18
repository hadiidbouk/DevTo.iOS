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
        articles.append(Article(typeOf: "article",
                                id: 108808,
                                title: "What are your five most used terminal commands?",
                                description: "community post to share our most used terminal commands.",
                                coverImageUrl: nil,
                                tagList: [
                                    "linux",
                                    "terminal",
                                    "unix",
                                    "discuss"],
                                slug: "what-are-your-five-most-used-terminal-commands-1hmd",
                                path: "/ecologic/what-are-your-five-most-used-terminal-commands-1hmd",
                                url: "https://dev.to/ecologic/what-are-your-five-most-used-terminal-commands-1hmd",
                                canonicalUrl: "https://dev.to/ecologic/what-are-your-five-most-used-terminal-commands-1hmd",
                                commentsCount: 42,
                                positiveReactionsCount: 66,
                                publishedTimestamp: ISO8601DateFormatter().date(from: "2019-05-15T12:59:49Z")!,
                                user: User(name: "M. Langhard",
                                           username: "riscie",
                                           twitterUserName: "Langhard",
                                           githubUsername: nil,
                                           websiteUrl: "http://www.ecologic.ch",
                                           profileImageUrl: "https://res.cloudinary.com/practicaldev/image/fetch/s--Bm4cBv1B--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://thepracticaldev.s3.amazonaws.com/uploads/user/profile_image/4301/3ec18c53-3c66-4e69-af53-41bfd6d21e4d.jpg",
                                           profileImage90Url: "https://res.cloudinary.com/practicaldev/image/fetch/s--2xUXGega--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://thepracticaldev.s3.amazonaws.com/uploads/user/profile_image/4301/3ec18c53-3c66-4e69-af53-41bfd6d21e4d.jpg"),
                                organization: Organization(name: "EcoLogic",
                                                           username: "ecologic",
                                                           slug: "ecologic",
                                                           profileImageUrl: "https://res.cloudinary.com/practicaldev/image/fetch/s--BZEmLpI7--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://thepracticaldev.s3.amazonaws.com/uploads/organization/profile_image/733/434c65fa-f905-4ef8-9652-a945d5f449ce.png",
                                                           profileImage90Url: "https://res.cloudinary.com/practicaldev/image/fetch/s--DJGQ90oG--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://thepracticaldev.s3.amazonaws.com/uploads/organization/profile_image/733/434c65fa-f905-4ef8-9652-a945d5f449ce.png"),
                                flareTag: FlareTag(name: "discuss",
                                                   backgroundColorHex: "#000000",
                                                   textColorHex: "#FFFFFF")))
        
        self.articles = Observable.just(articles)
    }
}
