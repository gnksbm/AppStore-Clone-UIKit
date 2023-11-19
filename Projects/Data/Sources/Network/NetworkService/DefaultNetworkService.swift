//
//  DefaultNetworkService.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

final class DefaultNetworkService: NetworkService {
    func request(endPoint: EndPoint) async -> Result<Data, NetworkError> {
        guard let urlRequest = endPoint.toURLRequest() else {
            return .failure(.invalidURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                return .failure(.invalidStatusCode)
            }
            return .success(data)
        } catch {
            return .failure(.transportError(error))
        }
    }
}
