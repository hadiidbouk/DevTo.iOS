//
//  ArticleDto.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

struct ArticleDto {
    
    let userProfilePictureUrl: URL
    let title: String
    let nameAndDate: String
    let timeAgo: String
    let tags: String
    let reactions: String
    let comments: String
        
    init(userProfilePictureUrl: URL,
        title: String,
        nameAndDate: String,
        timeAgo: String,
        tags: String,
        reactions: String,
        comments: String) {
        
        self.userProfilePictureUrl = userProfilePictureUrl
        self.title = title
        self.nameAndDate = nameAndDate
        self.timeAgo = timeAgo
        self.tags = tags
        self.reactions = reactions
        self.comments = comments
    }
}
