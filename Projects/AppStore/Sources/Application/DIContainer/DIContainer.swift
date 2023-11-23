//
//  DIContainer.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/16.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

final class DIContainer {
    static var storage: [String: Any] = [:]
    
    private init() { }
    
    static func register<T>(type: T.Type, _ object: T) {
        storage["\(type)"] = object
    }
    
    static func resolve<T>(type: T.Type) -> T {
        guard let object = storage["\(type)"] as? T else {
            fatalError("register 되지 않은 객체 호출: \(type)")
        }
        return object
    }
}
