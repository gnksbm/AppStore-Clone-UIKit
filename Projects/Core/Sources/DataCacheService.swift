//
//  DataCacheService.swift
//  Data
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public final class DataCacheService {
    public static let shared = DataCacheService()
    private let cache = NSCache<NSURL, NSData>()
    
    private init() { }
    
    public func fetchData(url: URL?) -> Data? {
        guard let url else { return nil }
        if let cachedData = getCachedData(url: url) {
            return cachedData
        }
        do {
            let data = try Data(contentsOf: url)
            cache.setObject(data as NSData, forKey: url as NSURL)
            return data
        } catch {
            return nil
        }
    }
    
    private func getCachedData(url: URL) -> Data? {
        cache.object(forKey: url as NSURL) as? Data
    }
}
