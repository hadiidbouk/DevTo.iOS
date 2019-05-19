//
//  UITableViewCell+Extensions.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func animate() {
        transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.transform = CGAffineTransform.identity
        }
    }
}
