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
                let messengernavigationController = UINavigationController(rootViewController: UIViewController())
                messengernavigationController.title = "Messenger"
                messengernavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        
        
        viewControllers = [navigationController, secondnavigationController, messengernavigationController]
    }
}
