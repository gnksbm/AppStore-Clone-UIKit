//
//  ThirdPartyLibs.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {
        case rxSwift, rxCocoa
        
        public var external: TargetDependency {
            switch self {
            case .rxCocoa:
                return TargetDependency.external(name: "RxSwift")
            case .rxSwift:
                return TargetDependency.external(name: "RxCocoa")
            }
        }
    }
    
    enum Carthage { }
}
