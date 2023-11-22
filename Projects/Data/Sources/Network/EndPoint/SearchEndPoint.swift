//
//  SearchEndPoint.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import Domain

struct SearchEndPoint: EndPoint {
    var baseURL: URL? {
        URL(string: "https://itunes.apple.com/")
    }
    
    var header: [String: String] {
        [:]
    }
    
    var path: String {
        "search"
    }
    
    var queryParameter: [String: String]
    
    var method: HTTPMethod {
        .get
    }
    
    init(query: SearchQuery) {
        self.queryParameter = [
            "country": "kr",
            "entity": "software",
            "term": query.term,
            "limit": String(query.limit)
        ]
    }
}
