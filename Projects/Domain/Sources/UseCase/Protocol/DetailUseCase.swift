//
//  DetailUseCase.swift
//  Domain
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public protocol DetailUseCase {
    func fetchDetailItem(id: String) -> Observable<AppDetailResponse>
}
