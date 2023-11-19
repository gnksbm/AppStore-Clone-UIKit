//
//  ThirdPartyLibs.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {
        case rxSwift
        
        public var external: TargetDependency {
            switch self {
            case .rxSwift:
                return TargetDependency.external(name: "RxSwift")
            }
        }
    }
    
    enum Carthage { }
}
