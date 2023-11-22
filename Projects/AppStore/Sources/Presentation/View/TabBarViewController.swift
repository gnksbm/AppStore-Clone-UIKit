//
//  TabBarViewController.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

#if DEBUG
import SwiftUI
struct TabBarViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview(TabBarViewController())
    }
}
#endif
