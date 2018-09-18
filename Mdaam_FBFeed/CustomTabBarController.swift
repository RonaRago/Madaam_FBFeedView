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
        
        viewControllers = [navigationController]
    }
}
