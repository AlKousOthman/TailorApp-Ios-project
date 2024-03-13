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
        view.backgroundColor = .white
        setupViewControllers()
        
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func setupViewControllers() {

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        
        
        let orderStatusViewController = OrderStatusViewController()
        orderStatusViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        orderStatusViewController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "note.text.badge.plus"), selectedImage: UIImage(systemName: "note.text.badge.plus.fill"))
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        
        viewControllers = [homeViewController, orderStatusViewController,profileViewController]
    }
    
}
