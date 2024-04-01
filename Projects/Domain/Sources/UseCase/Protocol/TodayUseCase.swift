//
//  TodayUseCase.swift
//  Domain
//
//  Created by gnksbm on 2023/12/02.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public protocol TodayUseCase {
    func fetchTodayApp() -> Observable<[SearchAppMinResponse]>
}
