//
//  SearchAppUseCase.swift
//  Domain
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift

public protocol SearchAppUseCase {
    func searchApp(query: SearchQuery) -> Observable<[ApplicationData]>
    func getRandomWords(query: RandomWordQuery) -> Observable<[String]>
}
