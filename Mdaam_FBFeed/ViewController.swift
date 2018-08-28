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

    return CGSize(width: view.frame.width, height: 400)
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

    //Sample name in cellls
    let nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    
    let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\nDecember 18 * San Francisco * ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:
        UIColor.rgb(155, green: 161, blue: 161)]))
        label.attributedText = attributedText

    //Increase spacing
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
    
    //Global icon in post
    let attachment = NSTextAttachment()
    attachment.image = UIImage(named: "globe_small")
    attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        label.attributedText = attributedText
    return label
        
    }()

    //Set profile image in cells
    let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "zuckprofile")
    imageView.contentMode = .scaleAspectFit
    return imageView
    
    }()

    //Post status
    let statusTextView: UITextView = {
    let textView = UITextView()
    textView.text = "Hello World! Let's try Swift."
    textView.font = UIFont.systemFont(ofSize: 14)
    //textView.isScrollEnabled = false
    return textView
    }()

    //Imagepost
    let statusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "zuckdog")
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
    }()

    //Likes and Comment
    let likescommentsLabel: UILabel = {
    let label = UILabel()
    label.text = "488 Likes  10.7K Comments"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = UIColor.rgb(155, green: 161, blue: 171)
    return label
    }()

    //Divider Line Between Image post and Likes Comment
        let dividerLineView: UIView = {
        let view  = UIView()
            view.backgroundColor = UIColor.rgb(226, green:288, blue:200)
        return view
        }()
        
    //LikeButton
        let likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Like", for: UIControlState())
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 263), for: UIControlState() )
            button.setImage(UIImage(named: "like"), for: UIControlState())
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
        }()

    // Call all views
    func setupViews(){
    backgroundColor = UIColor.white

    addSubview(nameLabel)
    addSubview(profileImageView)
    addSubview(statusTextView)
    addSubview(statusImageView)
    addSubview(likescommentsLabel)
    addSubview(dividerLineView)
    addSubview(likeButton)
        

     
    addConstraintswithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
    addConstraintswithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
    addConstraintswithFormat(format: "H:|[v0]|", views: statusImageView)
    addConstraintswithFormat(format: "H:|-12-[v0]|", views: likescommentsLabel)
    addConstraintswithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        addConstraintswithFormat(format: "H:|[v0]|", views: likeButton)
    addConstraintswithFormat(format: "V:|-12-[v0]", views: nameLabel)
    
    //ConstraintsFormat
    addConstraintswithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, likescommentsLabel,dividerLineView,likeButton)
    }
    }

    //extension for UIColor
    extension UIColor {
        
        static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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
