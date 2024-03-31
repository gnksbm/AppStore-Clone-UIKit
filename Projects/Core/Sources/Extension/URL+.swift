//
//  URL+.swift
//  Core
//
//  Created by gnksbm on 2023/12/01.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(url: URL) {
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
}
