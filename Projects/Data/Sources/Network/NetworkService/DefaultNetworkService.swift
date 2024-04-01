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
    
    public func request(endPoint: EndPoint) -> Observable<(Data)> {
        guard let urlRequest = endPoint.toURLRequest() else {
            return .error(NetworkError.invalidURL)
        }
        return .create { emitter in
            let task = URLSession.shared.dataTask(
                with: urlRequest
            ) { data, response, error in
                if let error {
                    emitter.onError(NetworkError.transportError(error))
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      200...299 ~= httpResponse.statusCode
                else {
                    emitter.onError(NetworkError.invalidStatusCode)
                    return
                }
                guard let data else {
                    emitter.onError(NetworkError.invalidData)
                    return
                }
                emitter.onNext(data)
                emitter.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
