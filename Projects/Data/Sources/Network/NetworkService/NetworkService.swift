//
//  NetworkService.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

protocol NetworkService {
    func request(endPoint: EndPoint) async -> Result<Data, NetworkError>
}