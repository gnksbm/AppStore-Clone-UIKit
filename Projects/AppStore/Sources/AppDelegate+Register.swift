//
//  AppDelegate+Register.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/23.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import Data
import Core
import Domain

extension AppDelegate {
    func registerDependencies() {
        let networkService = DefaultNetworkService()
        let searchAppRepository = DefaultSearchAppRepository(
            networkService: networkService
        )
        let randomWordRepository = DefaultRandomWordRepository(
            networkService: networkService
        )
        DIContainer.register(
            type: SearchAppUseCase.self,
            DefaultSearchAppUseCase(
                searchAppRepository: searchAppRepository,
                randomWordRepository: randomWordRepository
            )
        )
        DIContainer.register(
            type: NetworkService.self,
            DefaultNetworkService()
        )
        DIContainer.register(
            type: AppDetailRepository.self,
            DefaultAppDetailRepository()
        )
    }
}
