//
//  ArticleDetails.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

struct ArticleDetails {
    
    let typeOf: String
    let id: Int
    let title: String
    let description: String
    let coverImageUrl: String?
    let socialImageUrl: String?
    let tags: [String]
    let slug: String
    let path: String
    let url: String
    let canonicalUrl: String
    let commentsCount: Int
    let positiveReactionsCount: Int
    let publishedTimestamp: Date
    let bodyHtml: String
    let ltagStyle: [String]
    let ltagScript: [String]
    let user: User
    
    init(typeOf: String,
         id: Int,
         title: String,
         description: String,
         coverImageUrl: String?,
         socialImageUrl: String?,
         tags: [String],
         slug: String,
         path: String,
         url: String,
         canonicalUrl: String,
         commentsCount: Int,
         positiveReactionsCount: Int,
         publishedTimestamp: Date,
         bodyHtml: String,
         ltagStyle: [String],
         ltagScript: [String],
         user: User) {
        
        self.typeOf = typeOf
        self.id = id
        self.title = title
        self.description = description
        self.coverImageUrl = coverImageUrl
        self.socialImageUrl = socialImageUrl
        self.tags = tags
        self.slug = slug
        self.path = path
        self.url = url
        self.canonicalUrl = canonicalUrl
        self.commentsCount = commentsCount
        self.positiveReactionsCount = positiveReactionsCount
        self.publishedTimestamp = publishedTimestamp
        self.bodyHtml = bodyHtml
        self.ltagStyle = ltagStyle
        self.ltagScript = ltagScript
        self.user = user
    }
}

//MARK: Decodable
extension ArticleDetails : Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case typeOf = "type_of"
        case id = "id"
        case title = "title"
        case description = "description"
        case coverImageUrl = "cover_image"
        case socialImageUrl = "social_image"
        case tags = "tags"
        case slug = "slug"
        case path = "path"
        case url = "url"
        case canonicalUrl = "canonical_url"
        case commentsCount = "comments_count"
        case positiveReactionsCount = "positive_reactions_count"
        case publishedTimestamp = "published_timestamp"
        case bodyHtml = "body_html"
        case user = "user"
        case ltagStyle = "ltag_style"
        case ltagScript = "ltag_script"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeOf = try? container.decode(String.self, forKey: .typeOf)
        let id = try? container.decode(Int.self, forKey: .id)
        let title = try? container.decode(String.self, forKey: .title)
        let description = try? container.decode(String.self, forKey: .description)
        let coverImageUrl = try? container.decode(String.self, forKey: .coverImageUrl)
        let socialImageUrl = try? container.decode(String.self, forKey: .socialImageUrl)
        let tags = try? container.decode([String].self, forKey: .tags)
        let slug = try? container.decode(String.self, forKey: .slug)
        let path = try? container.decode(String.self, forKey: .path)
        let url = try? container.decode(String.self, forKey: .url)
        let canonicalUrl = try? container.decode(String.self, forKey: .canonicalUrl)
        let commentsCount = try? container.decode(Int.self, forKey: .commentsCount)
        let positiveReactionsCount = try? container.decode(Int.self, forKey: .positiveReactionsCount)
        let publishedTimestamp = try? container.decode(Date.self, forKey: .publishedTimestamp)
        let bodyHtml = try? container.decode(String.self, forKey: .bodyHtml)
        let user = try? container.decode(User.self, forKey: .user)
        let ltagStyle = try? container.decode([String].self, forKey: .ltagStyle)
        let ltagScript = try? container.decode([String].self, forKey: .ltagScript)

        self.init(typeOf: typeOf!,
                  id: id!,
                  title: title!,
                  description: description!,
                  coverImageUrl: coverImageUrl,
                  socialImageUrl: socialImageUrl,
                  tags: tags!,
                  slug: slug!,
                  path: path!,
                  url: url!,
                  canonicalUrl: canonicalUrl!,
                  commentsCount: commentsCount!,
                  positiveReactionsCount: positiveReactionsCount!,
                  publishedTimestamp: publishedTimestamp!,
                  bodyHtml: bodyHtml!,
                  ltagStyle: ltagStyle!,
                  ltagScript: ltagScript!,
                  user: user!)
    }
}
