//
//  SearchAppRequest.swift
//  Domain
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public struct SearchAppRequest {
    public let term: String
    public let limit: Int
    
    public init(term: String, limit: Int = 5) {
        self.term = term
        self.limit = limit
    }
}
