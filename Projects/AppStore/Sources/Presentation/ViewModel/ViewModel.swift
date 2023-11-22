//
//  ViewModel.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/20.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output 
}
