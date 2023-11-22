//
//  SearchViewModel.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/21.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

class SearchViewModel: ViewModel {
    var useCase: SearchAppUseCase
    private var disposeBag = DisposeBag()
    
    struct Input {
        let searchTerm: Observable<String>
    }
    struct Output {
        let str: Observable<String>
    }
    
    init(useCase: SearchAppUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let strOb = input.searchTerm.asObservable()
        return Output(str: strOb)
    }
}
