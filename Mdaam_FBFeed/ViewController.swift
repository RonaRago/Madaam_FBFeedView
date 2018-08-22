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
            label.numberOfLines = 2
            
            let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
            
            attributedText.append(NSAttributedString(string: "\nDecember 18 * San Francisco * ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:
                UIColor(red:155/255, green: 161/225, blue: 171/255, alpha:1)]))
            label.attributedText = attributedText

            //increase spacing
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
            
            
            return label
        }()
        
        //set profile image in cells
        let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "zuckprofile")
            imageView.contentMode = .scaleAspectFit
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
