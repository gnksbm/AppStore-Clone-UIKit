//
//  DefaultDetailUseCase.swift
//  Domain
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Core

import RxSwift

public final class DefaultDetailUseCase: DetailUseCase {
    @Injected private var appDetailRepository: AppDetailRepository
    
    public init() { }
    
    public func fetchDetailItem(id: String) -> Observable<AppDetailResponse> {
        appDetailRepository.fetchDetailItem(request: AppDetailRequest(id: id))
    }
}
