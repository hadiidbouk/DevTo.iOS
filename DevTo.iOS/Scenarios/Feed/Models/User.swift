//
//  User.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

struct User {
    
    let name: String
    let username: String
    let twitterUserName: String?
    let githubUsername: String?
    let websiteUrl: String?
    let profileImageUrl: String
    let profileImage90Url: String
    
    init(name: String?,
         username: String?,
         twitterUserName: String?,
         githubUsername: String?,
         websiteUrl: String?,
         profileImageUrl: String?,
         profileImage90Url: String?) {
        
        self.name = name ?? ""
        self.username = username ?? ""
        self.twitterUserName = twitterUserName
        self.githubUsername = githubUsername
        self.websiteUrl = websiteUrl
        self.profileImageUrl = profileImageUrl ?? ""
        self.profileImage90Url = profileImage90Url ?? ""
    }
}

//MARK: Decodable
extension User : Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case twitterUserName = "twitter_username"
        case githubUsername = "github_username"
        case websiteUrl = "website_url"
        case profileImageUrl = "profile_image"
        case profileImage90Url = "profile_image_90"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try? container.decode(String.self, forKey: .name)
        let username = try? container.decode(String.self, forKey: .username)
        let twitterUserName = try? container.decode(String.self, forKey: .twitterUserName)
        let githubUsername = try? container.decode(String.self, forKey: .githubUsername)
        let websiteUrl = try? container.decode(String.self, forKey: .websiteUrl)
        let profileImageUrl = try? container.decode(String.self, forKey: .profileImageUrl)
        let profileImage90Url = try? container.decode(String.self, forKey: .profileImage90Url)

        self.init(name: name,
                  username: username,
                  twitterUserName: twitterUserName,
                  githubUsername: githubUsername,
                  websiteUrl: websiteUrl,
                  profileImageUrl: profileImageUrl,
                  profileImage90Url: profileImage90Url)
    }
}
