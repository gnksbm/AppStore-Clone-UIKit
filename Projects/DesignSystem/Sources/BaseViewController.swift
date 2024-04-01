//
//  BaseViewController.swift
//  DesignSystem
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemBackground
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
