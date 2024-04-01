//
//  RandomWordEndPoint.swift
//  Data
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

struct RandomWordEndPoint: EndPoint {
    var baseURL: URL? {
        URL(string: "https://random-word-api.herokuapp.com")
    }
    
    var header: [String : String] {
        [:]
    }
    
    var path: String {
        "word"
    }
    
    var queryParameter: [String : String]
    
    var method: HTTPMethod {
        .get
    }
    
    init(query: RandomWordRequest) {
        self.queryParameter = [
            "number": query.count,
            "length": query.wordLength,
        ]
    }
}
