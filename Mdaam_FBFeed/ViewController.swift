//
//  ViewController.swift
//  Mdaam_FBFeed
//
//  Created by Rona Rago on 14/08/2018.
//  Copyright © 2018 Rona Rago. All rights reserved.
//

import UIKit

let cellId = "cellId"
class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigationbar Title 
        navigationItem.title = "Facebook Feed"
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 60)
    }

}

    class FeedCell: UICollectionViewCell{
    override init(frame: CGRect) {
    super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        //sample name in cellls
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Sample Name"
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            //label.numberOfLines = 2
            return label
        }()
        
        //set profile image in cells
        let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor=UIColor.red
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
            
        }()
        
    // Call all views
    func setupViews(){
        backgroundColor = UIColor.white

        addSubview(nameLabel)
        addSubview(profileImageView)
        
        addConstraintswithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintswithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintswithFormat(format: "V:|-8-[v0(44)]|", views: profileImageView)
        
        
        
    }
}

    //extension for all constraints
extension UIView{
    
    func addConstraintswithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
           let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
