//
//  TabBarViewController.swift
//  BloggingApp
//
//  Created by Jang Seok jin on 2021/08/13.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    private func setUI() {
        guard let currentUserEmail = UserDefaults.standard.string(forKey: "email") else { return }
        
        let main = MainViewController()
        main.title = "Main"
        let profile = ProfileViewController(currentEmail: currentUserEmail)
        profile.title = "Profile"
        
        main.navigationItem.largeTitleDisplayMode = .always
        profile.navigationItem.largeTitleDisplayMode = .always
        
        let firstNavi = UINavigationController(rootViewController: main)
        let secondNavi = UINavigationController(rootViewController: profile)
        
        firstNavi.navigationBar.prefersLargeTitles = true
        secondNavi.navigationBar.prefersLargeTitles = true
        
        firstNavi.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), tag: 1)
        secondNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        
        setViewControllers([firstNavi, secondNavi], animated: true)
    }
}
