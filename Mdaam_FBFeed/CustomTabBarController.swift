//
//  CustomTabBarController.swift
//  Mdaam_FBFeed
//
//  Created by Rona Rago on 18/09/2018.
//  Copyright © 2018 Rona Rago. All rights reserved.
//

import UIKit

class CustomTabBarController : UITabBarController{
    override func viewDidLoad(){
    super.viewDidLoad()
                let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
                let navigationController = UINavigationController(rootViewController: feedController)
                //First tab  News Feed
                navigationController.title = "News Feed"
                navigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
                //Second tab  Friend Request
                let friendRequestsController = FriendRequestsController()
                let secondnavigationController = UINavigationController(rootViewController: friendRequestsController)
                secondnavigationController.title = "Requests"
                secondnavigationController.tabBarItem.image = UIImage(named: "requests_icon")
        
                //Third tab  Messenger
                let messengerVC = UIViewController()
                messengerVC.navigationItem.title = "Messenger View"
                let messengernavigationController = UINavigationController(rootViewController: messengerVC)
                messengernavigationController.title = "Messenger"
                messengernavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        
                //Fourth tab  Global Notifications
                let notifVC = UIViewController()
                notifVC.navigationItem.title = "Global Notifications"
                let notificationsnavigationController = UINavigationController(rootViewController: notifVC)
                notificationsnavigationController.title = "Notifications"
                notificationsnavigationController.tabBarItem.image = UIImage(named: "globe_icon")
        
                //Fifth tab  Messenger
                let moreVC = UIViewController()
                moreVC.navigationItem.title = "More View"
                let morenavigationController = UINavigationController(rootViewController: moreVC)
                morenavigationController.title = "More"
                morenavigationController.tabBarItem.image = UIImage(named: "more_icon")
        
        
        
        
        viewControllers = [navigationController, secondnavigationController, messengernavigationController, notificationsnavigationController, morenavigationController]
    }
}
