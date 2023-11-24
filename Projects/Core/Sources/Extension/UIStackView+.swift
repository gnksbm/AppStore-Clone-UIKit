//
//  UIStackView+.swift
//  Core
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

extension UIStackView {
    func addDivider(color: UIColor) {
        let subViewCount = self.arrangedSubviews.count
        var insertAt = 1
        if subViewCount > 1 {
            for _ in 1...subViewCount - 1 {
                let separator = UIView()
                separator.backgroundColor = color
                insertArrangedSubview(separator, at: insertAt)
                insertAt += 2
                switch self.axis {
                case .vertical:
                    separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
                    separator.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
                case .horizontal:
                    separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
                    separator.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
                @unknown default:
                    break
                }
            }
        }
    }
}
