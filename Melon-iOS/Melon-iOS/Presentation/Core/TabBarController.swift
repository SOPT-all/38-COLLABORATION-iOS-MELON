//
//  TabBarController.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/11/26.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    enum Tab: Int, CaseIterable {
        case home
        case forYou
        case search
        case drawer
        case shortCut
        
        var imageName: UIImage {
            switch self {
            case .home: return .icBottomNaviHome
            case .forYou: return .icBottomNaviForyou
            case .search: return .icBottomNaviSearch
            case .drawer: return .icBottomNaviDesk
            case .shortCut: return .icBottomNaviMore
            }
        }
        
        var selectedImageName: UIImage {
            switch self {
            case .home: return .icBottomNaviHomePressed
            case .forYou: return .icBottomNaviForyouPressed
            case .search: return .icBottomNaviSearchPressed
            case .drawer: return .icBottomNaviDeskPressed
            case .shortCut: return .icBottomNaviMorePressed
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .home:
                return HomeViewController()
            case .forYou:
                return UIViewController()
            case .search:
                return UIViewController()
            case .drawer:
                return UIViewController()
            case .shortCut:
                return UIViewController()
            }
        }
        
        var title: String {
            switch self {
            case .home:
                return "홈"
            case .forYou:
                return "ForYou"
            case .search:
                return "탐색"
            case .drawer:
                return "음악서랍"
            case .shortCut:
                return "바로가기"
            }
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        setTabBarAppearance()
    }
    
    // MARK: - Private Methods
    
    private func setViewControllers() {
        self.viewControllers = Tab.allCases.map { tab in
            let rootViewController = tab.viewController
            let navigation = UINavigationController(rootViewController: rootViewController)
            navigation.isNavigationBarHidden = true
            navigation.tabBarItem = UITabBarItem(title: tab.title,
                                                 image: tab.imageName.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: tab.selectedImageName.withRenderingMode(.alwaysOriginal))
            navigation.tabBarItem.tag = tab.rawValue
            
            navigation.tabBarItem.imageInsets = UIEdgeInsets(
                top: 3,
                left: 0,
                bottom: -3,
                right: 0
            )
            
            return navigation
        }
    }
    
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .appBlack
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.gray300
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.green01
        ]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
