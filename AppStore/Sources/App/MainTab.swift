//
//  MainTab.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

enum MainTab: Int, CaseIterable {
    case today, game, app, arcade, search
    
    var info: ViewInfo {
        switch self {
        case .today:
            return .init(title: "투데이", imgName: "doc.text.image", vc: TodayVC())
        case .game:
            return .init(title: "게임", imgName: "gamecontroller", vc: UIViewController())
        case .app:
            return .init(title: "앱", imgName: "square.stack.3d.up.fill", vc: UIViewController())
        case .arcade:
            return .init(title: "Arcade", imgName: "figure.play", vc: UIViewController())
        case .search:
            return .init(title: "검색", imgName: "magnifyingglass", vc: UIViewController())
        }
    }
    
    static func makeViewControllers() -> [UINavigationController] {
        var navigationControllers: [UINavigationController] = []
        
        Self.allCases.forEach {
            let navigationController = UINavigationController(rootViewController: $0.info.vc)
            navigationController.tabBarItem = UITabBarItem(title: $0.info.title, image: UIImage(systemName: $0.info.imgName), tag: $0.rawValue)
            navigationController.tabBarItem.selectedImage = UIImage(systemName: $0.info.imgName)
            navigationControllers.append(navigationController)
        }
        
        return navigationControllers
    }
    
    struct ViewInfo {
        let title: String
        let imgName: String
        let vc: UIViewController
    }
}
