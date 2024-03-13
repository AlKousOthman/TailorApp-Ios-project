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
        
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func setupViewControllers() {
             let homeViewController = HomeViewController()
             let orderStatusViewController = OrderStatusViewController()
             let profileViewController = ProfileViewController()
             
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
            
        orderStatusViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "purchased.circle"), selectedImage: UIImage(systemName: "purchased.circle.fill"))
            
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "profile"), selectedImage: UIImage(systemName: "profile.fill"))
             
             viewControllers = [homeViewController, orderStatusViewController, profileViewController]
         }
    
}
