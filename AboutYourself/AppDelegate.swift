//
//  AppDelegate.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 03.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        
        let storyNavigationViewController = UINavigationController(rootViewController: StoryRootVC())
        storyNavigationViewController.tabBarItem = UITabBarItem(title: "Story", image: UIImage(systemName: "book.closed"), selectedImage: UIImage(systemName: "book.closed.fill"))
        
        let aboutNavigationViewController = UINavigationController(rootViewController: AboutYouRootVC())
        aboutNavigationViewController.tabBarItem = UITabBarItem(title: "About You", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [storyNavigationViewController, aboutNavigationViewController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

