//
//  ViewController.swift
//  Mdaam_FBFeed
//
//  Created by Rona Rago on 14/08/2018.
//  Copyright © 2018 Rona Rago. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigationbar Title
        navigationItem.title = "Facebook Feed"
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

   

}

