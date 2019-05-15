//
//  UIColor+Extensions.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: UInt8, g: UInt8, b: UInt8, alpha: CGFloat = 1.0) {
        let divider: CGFloat = 255.0
        self.init(red: CGFloat(r)/divider, green: CGFloat(g)/divider, blue: CGFloat(b)/divider, alpha: alpha)
    }
    
    private convenience init(rgbWithoutValidation value: Int32, alpha: CGFloat = 1.0) {
        self.init(
            r: UInt8((value & 0xFF0000) >> 16),
            g: UInt8((value & 0x00FF00) >> 8),
            b: UInt8(value & 0x0000FF),
            alpha: alpha
        )
    }
    
    convenience init?(rgb: Int32, alpha: CGFloat = 1.0) {
        if rgb > 0xFFFFFF || rgb < 0 { return nil }
        self.init(rgbWithoutValidation: rgb, alpha: alpha)
    }
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var charSet = CharacterSet.whitespacesAndNewlines
        charSet.insert("#")
        let _hex = hex.trimmingCharacters(in: charSet)
        guard _hex.range(of: "^[0-9A-Fa-f]{6}$", options: .regularExpression) != nil else { return nil }
        var rgb: UInt32 = 0
        Scanner(string: _hex).scanHexInt32(&rgb)
        self.init(rgbWithoutValidation: Int32(rgb), alpha: alpha)
    }
}
