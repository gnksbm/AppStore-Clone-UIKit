//
//  Int+.swift
//  Core
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public extension Int {
    var toKRStr: String {
        let numStr = String(self)
        switch numStr.count {
        case 4:
            let result: String
            let components = numStr
                .split(separator: "")
                .map { String($0) }
            if components[1] == "0" {
                result = components[0]
            } else {
                result = "\(components[0]).\(components[1])"
            }
            return result + "천"
        case 5...8:
            let result: String
            let components = numStr
                .suffix(5)
                .split(separator: "")
            if components[1] == "0" {
                result = String(numStr.dropLast(4))
            } else {
                result = "\(String(numStr.dropLast(4))).\(components[1])"
            }
            return result + "만"
        case 9...:
            let result: String
            let components = numStr
                .suffix(9)
                .split(separator: "")
            if components[1] == "0" {
                result = String(numStr.dropLast(8))
            } else {
                result = "\(String(numStr.dropLast(8))).\(components[1])"
            }
            return result + "억"
        default:
            return numStr
        }
    }
}
