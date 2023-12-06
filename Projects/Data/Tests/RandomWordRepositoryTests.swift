import XCTest
@testable import Data
@testable import RxSwift

final class RandomWordRepositoryTests: XCTestCase {
    var sut: DefaultRandomWordRepository!
    var networkService: NetworkService!
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        networkService = DefaultNetworkService()
        sut = DefaultRandomWordRepository(networkService: networkService)
        disposeBag = .init()
    }

    override func tearDownWithError() throws {
    }

    func testExample() async throws {
    }
    
    func test_랜덤문자배열_받아오기() async throws {
        var result: [String] = []
        let count = (0..<1000).randomElement()!
        sut.getWords(query: .init(count: count)).subscribe(onNext: {
            result = $0
            XCTAssertEqual(result.count, count)
        }).disposed(by: disposeBag)
    }
    
    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
