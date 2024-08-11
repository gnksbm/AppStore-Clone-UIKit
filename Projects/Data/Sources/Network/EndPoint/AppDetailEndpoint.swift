//
//  AppDetailEndpoint.swift
//  Data
//
//  Created by gnksbm on 8/11/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

struct AppDetailEndpoint: EndPoint {
    let request: AppDetailRequest
    
    var baseURL: URL? { URL(string: "https://itunes.apple.com/") }
    var path: String { "lookup" }
    var queryParameter: [String : String] { ["id": request.id] }
    var header: [String : String] { [:] }
    var method: HTTPMethod { .get }
}
