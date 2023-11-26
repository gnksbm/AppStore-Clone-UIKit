//
//  ThirdPartyLibs.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension TargetDependency {
    static let rxSwift: Self = .external(name: "RxSwift")
    static let rxCocoa: Self = .external(name: "RxCocoa")
}
