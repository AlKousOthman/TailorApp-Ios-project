//
//  MainTapBarController.swift
//  TailorApp
//
//  Created by Noura Aldaihani on 12/03/2024.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        homeViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        
        
        let orderStatusViewController = OrderStatusViewController()
        orderStatusViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        orderStatusViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "purchased.circle"), selectedImage: UIImage(systemName: "purchased.circle.fill"))
        
//        let profileViewController = ProfileViewController()
//        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
//        profileViewController.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "profile"), selectedImage: UIImage(systemName: "profile.fill"))
        
        
        viewControllers = [homeViewController, orderStatusViewController]
    }
    
}
