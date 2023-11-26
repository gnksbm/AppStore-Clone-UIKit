//
//  ApplicationRepository.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift

public protocol ApplicationRepository {
    func searchApp(query: SearchQuery) async -> Observable<[ApplicationData]>
}
