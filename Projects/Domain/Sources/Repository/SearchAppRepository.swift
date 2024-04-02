//
//  SearchAppRepository.swift
//  Domain
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public protocol SearchAppRepository {
    func searchApp(
        request: SearchAppRequest
    ) -> Observable<[SearchAppMinResponse]>
    func searchApp(
        request: SearchAppRequest
    ) -> Observable<[SearchAppMidResponse]>
}
