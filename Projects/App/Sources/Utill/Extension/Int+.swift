//
//  Int+.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

extension Int {
    var toPriceStr: String {
        let numformat = NumberFormatter()
        numformat.numberStyle = .decimal
        guard let result = numformat.string(from: self as NSNumber) else { return "Error" }
        return "₩" + result
    }
}
