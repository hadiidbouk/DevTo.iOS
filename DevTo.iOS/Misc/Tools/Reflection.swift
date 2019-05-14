//
//  Reflection.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import Foundation

protocol Reflection { }

extension Reflection {
    
    var className: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
    
    static var className: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
}

