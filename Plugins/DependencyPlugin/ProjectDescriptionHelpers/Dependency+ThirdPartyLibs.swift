//
//  ThirdPartyLibs.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension Dictionary<String, Product> {
    static let thirdPartyTypes: Self = [
        "RxCocoa": .framework,
        "RxCocoaRuntime": .framework,
        "RxRelay": .framework,
    ]
}

public extension Array<Package> {
    static let thirdPartyRemote = ThirdPartyRemote.allCases
        .map {
            $0.package
        }
    
    enum ThirdPartyRemote: CaseIterable {
        case rxSwift
        
        var package: Element {
            switch self {
            case .rxSwift:
                return .remote(
                    url: "https://github.com/ReactiveX/RxSwift",
                    requirement: .exact("6.0.0")
                )
            }
        }
    }
}

public extension Array<TargetDependency> {
    static let thirdPartyExternal = ThirdPartyExternal.allCases
        .map {
            Element.external(name: $0.name)
        }
    enum ThirdPartyExternal: String, CaseIterable {
        case rxSwift, rxCocoa
        
        var name: String {
            var name = rawValue.map { $0 }
            name.removeFirst()
            name.insert(Character(rawValue.first!.uppercased()), at: 0)
            return "\(String(name))"
        }
    }
}
