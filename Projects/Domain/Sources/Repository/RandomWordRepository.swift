//
//  RandomWordRepository.swift
//  Domain
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public protocol RandomWordRepository {
    func getWords(request: RandomWordRequest) -> Observable<[String]>
}
