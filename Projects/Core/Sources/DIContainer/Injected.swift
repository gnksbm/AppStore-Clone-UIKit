//
//  Injected.swift
//  Core
//
//  Created by gnksbm on 2023/11/16.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Injected<T> {
    public var wrappedValue: T {
        DIContainer.resolve(type: T.self)
    }
    
    public init() { }
}
