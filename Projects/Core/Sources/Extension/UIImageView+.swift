//
//  UIImageView+.swift
//  Core
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

public extension UIImageView {
    func loadImage(url: URL?) {
        Task {
            guard let data = await DataCacheService.shared.fetchData(url: url)
            else { return }
            image = UIImage(data: data)
        }
    }
}
