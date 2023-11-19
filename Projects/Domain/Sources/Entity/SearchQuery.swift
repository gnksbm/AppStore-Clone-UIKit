//
//  SearchQuery.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

struct SearchQuery {
    let term: String
    let limit: Int
    
    init(term: String, limit: Int = 5) {
        self.term = term
        self.limit = limit
    }
}
