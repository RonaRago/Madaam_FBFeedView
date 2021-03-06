//
//  ViewController.swift
//  Mdaam_FBFeed
//
//  Created by Rona Rago on 14/08/2018.
//  Copyright © 2018 Rona Rago. All rights reserved.
//

import UIKit

let cellId = "cellId"

//Modal Object for Posts
class Post{
    var name: String?
    var statusText: String?
    var profileImageName: String?
    var statusImageName: String?
    var numLikes: Int?
    var numComments: Int?
}
class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    //allocate post in array
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
                let postMark = Post()
                postMark.name = "Mark Zuckerberg"
                postMark.profileImageName = "zuckprofile"
                postMark.statusText = "By giving people the power to share, we're making the world more transparent."
                postMark.statusImageName = "zuckdog"
                postMark.numLikes = 400
                postMark.numComments = 123
        
                let postSteve = Post()
                postSteve.name = "Steve Jobs"
                postSteve.profileImageName = "steve_profile"
                postSteve.statusText = "Design is not just what it looks like and feels like. Design is how it works.\n\n" +
                    "Being the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful, that's what matters to me.\n\n" +
                "Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations."
                postSteve.statusImageName = "steve_status"
                postSteve.numLikes = 1000
                postSteve.numComments = 55
        
                let postGandhi = Post()
                postGandhi.name = "Mahatma Gandhi"
                postGandhi.profileImageName = "gandhi_profile"
                postGandhi.statusText = "Live as if you were to die tomorrow; learn as if you were to live forever.\n" +
                    "The weak can never forgive. Forgiveness is the attribute of the strong.\n" +
                "Happiness is when what you think, what you say, and what you do are in harmony."
                postGandhi.statusImageName = "gandhi_status"
                postGandhi.numLikes = 333
                postGandhi.numComments = 22

        
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postGandhi)
        

    //Navigationbar Title
    navigationItem.title = "Facebook Feed"
    collectionView?.alwaysBounceVertical = true
    collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
    collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
    //call feedcell
        feedCell.post = posts[indexPath.item]
        return feedCell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText {

            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options:NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
            let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 24)
        }

    return CGSize(width: view.frame.width, height: 500)
    }

    //Landscape and Portrait Orrientation of Screen Handling
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
}

    class FeedCell: UICollectionViewCell{
    
        var post: Post? {
            didSet{
                
                //namesetting
                if let name = post?.name{
                 
                    let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
                    attributedText.append(NSAttributedString(string: "\nDecember 18 * San Francisco * ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:
                        UIColor.rgb(155, green: 161, blue: 161)]))
                    //label.attributedText = attributedText
                    
                    //Increase spacing
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 4
                    attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                    
                    //Global icon in post
                    let attachment = NSTextAttachment()
                    attachment.image = UIImage(named: "globe_small")
                    attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                    attributedText.append(NSAttributedString(attachment: attachment))
                    nameLabel.attributedText = attributedText
                }
               
                
                if let statusText = post?.statusText{
                    statusTextView.text = statusText
                }
                
                //showing of profile image
                if let profileImagename = post?.profileImageName{
                    profileImageView.image = UIImage(named: profileImagename)
                }
                
                //showing of status image
                if let statusImagename = post?.statusImageName{
                    statusImageView.image = UIImage(named: statusImagename)
                }
                
                
            }
        }
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
    textView.isScrollEnabled = false
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

    //Likes and Comment Counter
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
    
    // FEED BTN
    let likeButton = FeedCell.buttonForTitle("Like", imageName: "like")
    let commentButton: UIButton = FeedCell.buttonForTitle("Comment", imageName: "comment")
    let shareButton: UIButton = FeedCell.buttonForTitle("Share", imageName: "share")
        
        
    //Function for all the button constraints
    static func buttonForTitle(_ title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), for: UIControlState())
        
        button.setImage(UIImage(named: imageName), for: UIControlState())
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }
    

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
    addSubview(commentButton)
    addSubview(shareButton)
    
    addConstraintswithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
    addConstraintswithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
    addConstraintswithFormat(format: "H:|[v0]|", views: statusImageView)
    addConstraintswithFormat(format: "H:|-12-[v0]|", views: likescommentsLabel)
    addConstraintswithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
    //button constraints
    addConstraintswithFormat(format: "H:|-12-[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
    addConstraintswithFormat(format: "V:|-12-[v0]", views: nameLabel)
    
    //ConstraintsFormat
    addConstraintswithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, likescommentsLabel,dividerLineView,likeButton)
    
    addConstraintswithFormat(format: "V:[v0(44)]|", views: commentButton)
    addConstraintswithFormat(format: "V:[v0(44)]|", views: shareButton)
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
