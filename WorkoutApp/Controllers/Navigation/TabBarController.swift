//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureAppearance()
        switchTo(tab: .session)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)
        
        overviewController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.overview,
                                                     image: R.Images.TabBar.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.session,
                                                     image: R.Images.TabBar.session,
                                                     tag: Tabs.session.rawValue)
        progressController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.progress,
                                                     image: R.Images.TabBar.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.settings,
                                                     image: R.Images.TabBar.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigation, sessionNavigation, progressNavigation, settingsNavigation
        ], animated: false)
    }
    
}
