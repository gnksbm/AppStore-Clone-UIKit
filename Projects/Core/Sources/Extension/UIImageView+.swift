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
        DispatchQueue.global().async {
            guard let data = DataCacheService.shared.fetchData(url: url)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = .init(data: data)
            }
        }
    }
}
