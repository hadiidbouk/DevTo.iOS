//
//  UIScreen+Extensions.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

extension UIScreen {
    
    static var topSafeArea: CGFloat = {
        return (UIApplication.shared.delegate as! AppDelegate).window!.safeAreaInsets.top
    }()
    
    static var bottomSafeArea: CGFloat = {
       return (UIApplication.shared.delegate as! AppDelegate).window!.safeAreaInsets.bottom
    }()
}
