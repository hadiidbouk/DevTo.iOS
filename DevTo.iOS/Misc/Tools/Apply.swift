//
//  Apply.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

protocol HasApply { }

extension HasApply {
    func apply(closure: (Self) -> ()) {
        closure(self)
    }
}

extension UIView: HasApply { }
