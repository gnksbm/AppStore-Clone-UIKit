//
//  AppDetailRepository.swift
//  Domain
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public protocol AppDetailRepository {
    func fetchDetailItem(
        request: AppDetailRequest
    ) -> Observable<AppDetailResponse>
}
