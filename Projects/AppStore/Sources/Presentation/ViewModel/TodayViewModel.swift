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
    
    struct Input { }
    struct Output { }
    
    init(useCase: SearchAppUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
