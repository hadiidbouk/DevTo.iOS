//
//  Article.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

struct Article {
    
    let typeOf: String
    let id: Int
    let title: String
    let description: String
    let coverImageUrl: String?
    let tagList: [String]
    let slug: String
    let path: String
    let url: String
    let canonicalUrl: String
    let commentsCount: Int
    let positiveReactionsCount: Int
    let publishedTimestamp: Date
    let user: User
    let organization: Organization?
    let flareTag: FlareTag?
    
    init(typeOf: String,
         id: Int,
         title: String,
         description: String,
         coverImageUrl: String?,
         tagList: [String],
         slug: String,
         path: String,
         url: String,
         canonicalUrl: String,
         commentsCount: Int,
         positiveReactionsCount: Int,
         publishedTimestamp: Date,
         user: User,
         organization: Organization?,
         flareTag: FlareTag?) {
        
        self.typeOf = typeOf
        self.id = id
        self.title = title
        self.description = description
        self.coverImageUrl = coverImageUrl
        self.tagList = tagList
        self.slug = slug
        self.path = path
        self.url = url
        self.canonicalUrl = canonicalUrl
        self.commentsCount = commentsCount
        self.positiveReactionsCount = positiveReactionsCount
        self.publishedTimestamp = publishedTimestamp
        self.user = user
        self.organization = organization
        self.flareTag = flareTag
    }
}

//MARK: Decodable
extension Article : Decodable {
    
    enum CodingKeys: String, CodingKey {
        case typeOf = "type_of"
        case id = "id"
        case title = "title"
        case description = "description"
        case coverImageUrl = "cover_image"
        case tagList = "tag_list"
        case slug = "slug"
        case path = "path"
        case url = "url"
        case canonicalUrl = "canonical_url"
        case commentsCount = "comments_count"
        case positiveReactionsCount = "positive_reactions_count"
        case publishedTimestamp = "published_timestamp"
        case user = "user"
        case organization = "organization"
        case flareTag = "flare_tag"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeOf = try? container.decode(String.self, forKey: .typeOf)
        let id = try? container.decode(Int.self, forKey: .id)
        let title = try? container.decode(String.self, forKey: .title)
        let description = try? container.decode(String.self, forKey: .description)
        let coverImageUrl = try? container.decode(String.self, forKey: .coverImageUrl)
        let tagList = try? container.decode([String].self, forKey: .tagList)
        let slug = try? container.decode(String.self, forKey: .slug)
        let path = try? container.decode(String.self, forKey: .path)
        let url = try? container.decode(String.self, forKey: .url)
        let canonicalUrl = try? container.decode(String.self, forKey: .canonicalUrl)
        let commentsCount = try? container.decode(Int.self, forKey: .commentsCount)
        let positiveReactionsCount = try? container.decode(Int.self, forKey: .positiveReactionsCount)
        let publishedTimestamp = try? container.decode(Date.self, forKey: .publishedTimestamp)
        let user = try? container.decode(User.self, forKey: .user)
        let organization = try? container.decode(Organization.self, forKey: .organization)
        let flareTag = try? container.decode(FlareTag.self, forKey: .flareTag)
        
        self.init(typeOf: typeOf!,
                  id: id!,
                  title: title!,
                  description: description!,
                  coverImageUrl: coverImageUrl,
                  tagList: tagList!,
                  slug: slug!,
                  path: path!,
                  url: url!,
                  canonicalUrl: canonicalUrl!,
                  commentsCount: commentsCount!,
                  positiveReactionsCount: positiveReactionsCount!,
                  publishedTimestamp: publishedTimestamp!,
                  user: user!,
                  organization: organization,
                  flareTag: flareTag)
    }
}
