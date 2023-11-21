//
//  TodayViewModel.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/20.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift
import Domain

class TodayViewModel: ViewModel {
    private var useCase: SearchAppUseCase
    private var disposeBag = DisposeBag()
    
    init(useCase: SearchAppUseCase) {
        self.useCase = useCase
    }
    
    func excute(term: String) async {
        let result = await useCase.searchApp(query: SearchQuery(term: term))
    }
}
