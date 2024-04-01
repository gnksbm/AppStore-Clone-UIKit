//
//  RandomWordRequest.swift
//  Domain
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public struct RandomWordRequest {
    public let count: String
    public let wordLength: String
    
    public init(count: Int = 6, wordLength: Int = 6) {
        self.count = String(count)
        self.wordLength = String(wordLength)
    }
}
