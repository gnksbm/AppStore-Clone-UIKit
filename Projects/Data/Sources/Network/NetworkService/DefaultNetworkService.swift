//
//  DefaultNetworkService.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift

public final class DefaultNetworkService: NetworkService {
    public init() { }
    
    public func request(endPoint: EndPoint) async -> Result<Data, Error> {
        guard let urlRequest = endPoint.toURLRequest() else {
            return .failure(NetworkError.invalidURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                return .failure(NetworkError.invalidStatusCode)
            }
            return .success(data)
        } catch {
            return .failure(NetworkError.transportError(error))
        }
    }
    func request(endPoint: EndPoint) async -> Observable<(Data)> {
        guard let urlRequest = endPoint.toURLRequest() else {
            return .error(NetworkError.invalidURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                return .error(NetworkError.invalidStatusCode)
            }
            return .just(data)
        } catch {
            return .error(NetworkError.transportError(error))
        }
    }
}
