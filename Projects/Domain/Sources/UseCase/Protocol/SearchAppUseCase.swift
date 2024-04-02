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
    var searchedApp: PublishSubject<[SearchAppMidResponse]> { get }
    var recommendedApp: PublishSubject<[SearchAppMinResponse]> { get }
    
    func searchApp(query: SearchAppRequest)
    func fetchRandomWords(query: RandomWordRequest) -> Observable<[String]>
    func fetchRecommendedApp()
}
