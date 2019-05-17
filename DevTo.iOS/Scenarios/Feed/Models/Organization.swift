//
//  Organization.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

struct Organization {
    
    let name: String
    let username: String
    let slug: String
    let profileImageUrl: String
    let profileImage90Url: String
    
    init(name: String?,
         username: String?,
         slug: String?,
         profileImageUrl: String?,
         profileImage90Url: String?) {
        
        self.name = name ?? ""
        self.username = username ?? ""
        self.slug = slug ?? ""
        self.profileImageUrl = profileImageUrl ?? ""
        self.profileImage90Url = profileImage90Url ?? ""
    }
}

//MARK: Decodable
extension Organization : Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case slug = "slug"
        case profileImageUrl = "profile_image"
        case profileImage90Url = "profile_image_90"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try? container.decode(String.self, forKey: .name)
        let username = try? container.decode(String.self, forKey: .username)
        let slug = try? container.decode(String.self, forKey: .slug)
        let profileImageUrl = try? container.decode(String.self, forKey: .profileImageUrl)
        let profileImage90Url = try? container.decode(String.self, forKey: .profileImage90Url)

        self.init(name: name,
                  username: username,
                  slug: slug,
                  profileImageUrl: profileImageUrl,
                  profileImage90Url: profileImage90Url)
    }
}
