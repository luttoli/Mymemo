//
//  ProfileDesignViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/09/15.
//

import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController, UITextViewDelegate {
    
    lazy var pageName: UILabel = {
        let pageName = UILabel()
        pageName.font = .systemFont(ofSize: 19, weight: .bold)
        pageName.textColor = .black
        pageName.text = "nabaecamp"
        return pageName
    }()
    
    lazy var pageMenuButton: UIButton = {
        let pageMenuButton = UIButton()
        pageMenuButton.setImage(UIImage(named: "Menu"), for: .normal)
        return pageMenuButton
    }()
    
    lazy var userPicImage: UIImageView = {
        let userPicImage = UIImageView()
        userPicImage.image = UIImage(named: "userPic")
        return userPicImage
    }()
    
    lazy var userFollowInfoStackView: UIStackView = {
        let userFollowInfoStackView = UIStackView(arrangedSubviews: [postStackView, followerStackView, followingStackView])
        userFollowInfoStackView.axis = .horizontal
        userFollowInfoStackView.distribution = .equalCentering
        userFollowInfoStackView.spacing = 15
        return userFollowInfoStackView
    }()
    
    lazy var postStackView: UIStackView = {
        let postStackView = UIStackView(arrangedSubviews: [postCount, postText])
        postStackView.axis = .vertical
        postStackView.alignment = .center
        postStackView.spacing = 3
        return postStackView
    }()
    
    lazy var postCount: UILabel = {
        let postCount = UILabel()
        postCount.text = "7"
        postCount.font = .systemFont(ofSize: 16, weight: .bold)
        return postCount
    }()
    
    lazy var postText: UILabel = {
        let postText = UILabel()
        postText.text = "post"
        postText.font = .systemFont(ofSize: 14, weight: .regular)
        return postText
    }()
    
    lazy var followerStackView: UIStackView = {
        let followerStackView = UIStackView(arrangedSubviews: [followerCount, followerText])
        followerStackView.axis = .vertical
        followerStackView.alignment = .center
        followerStackView.spacing = 3
        return followerStackView
    }()
    
    lazy var followerCount: UILabel = {
        let followerCount = UILabel()
        followerCount.text = "100"
        followerCount.font = .systemFont(ofSize: 16, weight: .bold)
        return followerCount
    }()
    
    lazy var followerText: UILabel = {
        let followerText = UILabel()
        followerText.text = "follower"
        followerText.font = .systemFont(ofSize: 14, weight: .regular)
        return followerText
    }()
    
    lazy var followingStackView: UIStackView = {
        let followingStackView = UIStackView(arrangedSubviews: [followingCount, followingText])
        followingStackView.axis = .vertical
        followingStackView.alignment = .center
        followingStackView.spacing = 3
        return followingStackView
    }()
    
    lazy var followingCount: UILabel = {
        let followingCount = UILabel()
        followingCount.text = "100"
        followingCount.font = .systemFont(ofSize: 16, weight: .bold)
        return followingCount
    }()
    
    lazy var followingText: UILabel = {
        let followingText = UILabel()
        followingText.text = "following"
        followingText.font = .systemFont(ofSize: 14, weight: .regular)
        return followingText
    }()
    
    lazy var userInfoStackView: UIStackView = {
        let userInfoStackView = UIStackView(arrangedSubviews: [userNickName, userIntro, userUrl])
        userInfoStackView.axis = .vertical
        userInfoStackView.spacing = 5
        return userInfoStackView
    }()
    
    lazy var userNickName: UILabel = {
        let userNickName = UILabel()
        userNickName.text = "르탄이"
        userNickName.font = .systemFont(ofSize: 16, weight: .bold)
        return userNickName
    }()
    
    lazy var userIntro: UILabel = {
        let userIntro = UILabel()
        userIntro.text = "iOS Developer 🍎"
        userIntro.font = .systemFont(ofSize: 14, weight: .regular)
        return userIntro
    }()
    
    lazy var userUrl: UILabel = {
        let userUrl = UILabel()
        userUrl.text = "spartacodingclub.kr"
        userUrl.font = .systemFont(ofSize: 14, weight: .regular)
        userUrl.textColor = UIColor.blue
        userUrl.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openURL))
        userUrl.addGestureRecognizer(tapGesture)
        return userUrl
    }()
    
    @objc func openURL() {
        if let url = URL(string: "https://spartacodingclub.kr") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    lazy var middleBarStackView: UIStackView = {
        let middleBarStackView = UIStackView(arrangedSubviews: [followButton, messageButton, moreButton])
        middleBarStackView.axis = .horizontal
        middleBarStackView.spacing = 8
        middleBarStackView.distribution = .fillProportionally
        return middleBarStackView
    }()
    
    lazy var followButton: UIButton = {
        let followButton = UIButton()
        followButton.setImage(UIImage(named: "Follow"), for: .normal)
        return followButton
    }()
    
    lazy var messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.setImage(UIImage(named: "Message"), for: .normal)
        return messageButton
    }()
    
    lazy var moreButton: UIButton = {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "More"), for: .normal)
        moreButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return moreButton
    }()
    
    lazy var navGalleryStackView: UIStackView = {
        let navGalleryStackView = UIStackView(arrangedSubviews: [gridzonStackView, gridButton1, gridButton2])
        navGalleryStackView.axis = .horizontal
        navGalleryStackView.spacing = 0
        navGalleryStackView.distribution = .fillEqually
        return navGalleryStackView
    }()
    
    lazy var navGalleryLineView: UIView = {
        let navGalleryLineView = UIView()
        navGalleryLineView.snp.makeConstraints { make in
            make.width.equalTo(navGalleryStackView)
            make.height.equalTo(1)
            make.top.equalTo(navGalleryLineView.snp.top)
        }
        navGalleryLineView.layer.borderWidth = 1
        navGalleryLineView.layer.borderColor = UIColor.gray.cgColor
        return navGalleryLineView
    }()
    
    lazy var gridzonStackView: UIStackView = {
        let gridzonStackView = UIStackView(arrangedSubviews: [gridButton, gridLineView])
        gridzonStackView.axis = .vertical
        gridzonStackView.spacing = 2
        return gridzonStackView
    }()
    
    lazy var gridButton: UIButton = {
        let gridButton = UIButton()
        gridButton.setImage(UIImage(named: "Grid"), for: .normal)
        gridButton.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        return gridButton
    }()
    
    lazy var gridLineView: UIView = {
        let gridView = UIView()
        gridView.snp.makeConstraints { make in
            make.width.equalTo(22)
            make.height.equalTo(1)
        }
        gridView.layer.borderWidth = 1
        gridView.layer.borderColor = UIColor.black.cgColor
        return gridView
    }()
    
    lazy var gridButton1: UIButton = {
        let gridButton1 = UIButton()
        return gridButton1
    }()
    
    lazy var gridButton2: UIButton = {
        let gridButton2 = UIButton()
        return gridButton2
    }()
    
    lazy var pictureCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let pictureCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        pictureCollectionView.register(PictureCell.self, forCellWithReuseIdentifier: "PictureCell")
        pictureCollectionView.dataSource = self
        pictureCollectionView.delegate = self
        return pictureCollectionView
    }()
    
    let pictureImg = [UIImage(named: "picture1.png"), UIImage(named: "picture2.png"), UIImage(named: "picture3.png"), UIImage(named: "picture4.png"), UIImage(named: "picture5.png"), UIImage(named: "picture6.png"), UIImage(named: "picture7.png"), UIImage(named: "picture8.png"), UIImage(named: "picture9.png"), UIImage(named: "picture10.png"), UIImage(named: "picture11.png"), UIImage(named: "picture12.png"), UIImage(named: "picture13.png"), UIImage(named: "picture14.png"),]
    
    lazy var bottomNavBarStackView: UIStackView = {
        let bottomNavBarStackView = UIStackView(arrangedSubviews: [profileTabButton])
        bottomNavBarStackView.axis = .horizontal
        bottomNavBarStackView.alignment = .center
        return bottomNavBarStackView
    }()
    
    lazy var profileTabButton: UIButton = {
        let profileTabButton = UIButton()
        profileTabButton.setImage(UIImage(named: "profile"), for: .normal)
        return profileTabButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(pageName)
        pageName.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            let status = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(status + 20)
        }
        
        view.addSubview(pageMenuButton)
        pageMenuButton.snp.makeConstraints { make in
            make.centerY.equalTo(pageName)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        view.addSubview(userPicImage)
        userPicImage.snp.makeConstraints { make in
            make.top.equalTo(pageName.snp.bottom).offset(14)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        view.addSubview(userFollowInfoStackView)
        userFollowInfoStackView.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-28)
            make.leading.equalTo(userPicImage.snp.trailing).offset(46)
            make.centerY.equalTo(userPicImage)
        }
        
        view.addSubview(userInfoStackView)
        userInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(userPicImage.snp.bottom).offset(20)
            make.leading.equalTo(userPicImage.snp.leading)
        }
        
        view.addSubview(middleBarStackView)
        middleBarStackView.snp.makeConstraints { make in
            make.top.equalTo(userInfoStackView.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        view.addSubview(navGalleryStackView)
        navGalleryStackView.snp.makeConstraints { make in
            make.top.equalTo(middleBarStackView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(pictureCollectionView)
        pictureCollectionView.snp.makeConstraints { make in
            make.top.equalTo(navGalleryStackView.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        view.addSubview(bottomNavBarStackView)
        bottomNavBarStackView.snp.makeConstraints { make in
            make.top.equalTo(pictureCollectionView.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        goBackGesture()
    }
    
    func goBackGesture() {
        let swipeDownGesture = UIPanGestureRecognizer(target: self, action: #selector(swipeDown))
        self.view.addGestureRecognizer(swipeDownGesture)
    }
    
    @objc func swipeDown(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)

        switch recognizer.state {
        case .changed:
            if translation.y > 0 {
                view.transform = CGAffineTransform(translationX: 0, y: translation.y)
            }
        case .ended:
            if translation.y > view.frame.size.height * 0.2 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.transform = .identity
                }
            }
        default:
            break
        }
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        presentingViewController?.view.alpha = 1.0
        super.dismiss(animated: flag, completion: completion)
    }
}

extension ProfileDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.identifier, for: indexPath) as! PictureCell
        
        cell.pictureImage.image = pictureImg[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 3
        let spacing: CGFloat = 2
        let availableWidth = collectionView.bounds.width - (spacing * (numberOfColumns - 1))
        let itemWidth = availableWidth / numberOfColumns
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
