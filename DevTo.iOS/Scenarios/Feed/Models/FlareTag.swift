//
//  FlareTag.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

struct FlareTag {
    
    let name: String
    let backgroundColorHex: String
    let textColorHex: String
    
    init(name: String?,
         backgroundColorHex: String?,
         textColorHex: String?) {
        
        self.name = name ?? ""
        self.backgroundColorHex = backgroundColorHex ?? ""
        self.textColorHex = textColorHex ?? ""
    }
}

//MARK: Decodable
extension FlareTag : Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case backgroundColorHex = "bg_color_hex"
        case textColorHex = "text_color_hex"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try? container.decode(String.self, forKey: .name)
        let backgroundColorHex = try? container.decode(String.self, forKey: .backgroundColorHex)
        let textColorHex = try? container.decode(String.self, forKey: .textColorHex)
        
        self.init(name: name,
                  backgroundColorHex: backgroundColorHex,
                  textColorHex: textColorHex)
    }
}
