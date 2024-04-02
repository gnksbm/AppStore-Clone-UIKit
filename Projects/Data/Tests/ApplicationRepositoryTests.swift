//
//  ApplicationRepositoryTests.swift
//  DataTests
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import XCTest
@testable import Data
@testable import RxSwift

final class ApplicationRepositoryTests: XCTestCase {
    var sut: DefaultSearchAppRepository!
    var networkService: NetworkService!
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        networkService = DefaultNetworkService()
        sut = DefaultSearchAppRepository(
            networkService: networkService
        )
        disposeBag = .init()
    }

    override func tearDownWithError() throws {
    }

    func testExample() async throws {
    }
    
    func test_앱스토어_검색하기() async throws {
        let count = (0..<10).randomElement()!
        sut.searchApp(query:
                .init(
                    term: "카카오",
                    limit: count
                )
        ).subscribe(onNext: {
            XCTAssertEqual($0.count, count)
        }).disposed(by: disposeBag)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
