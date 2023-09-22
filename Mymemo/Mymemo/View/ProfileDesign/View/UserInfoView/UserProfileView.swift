//
//  UserInfoView.swift
//  projectMVVM
//
//  Created by 김지훈 on 2023/09/21.
//

import UIKit
import SnapKit

class UserProfileView: UIView, UITextViewDelegate {
    
    lazy var userName: UILabel = {
        let userName = UILabel()
        userName.font = .systemFont(ofSize: 19, weight: .bold)
        userName.textColor = .black
        return userName
    }()
    
    lazy var menuButton: UIButton = {
        let menuButton = UIButton()
        menuButton.setImage(UIImage(named: "Menu"), for: .normal)
        return menuButton
    }()
    
    lazy var userPicImage: UIImageView = {
        let userPicImage = UIImageView()
        userPicImage.image = UIImage(named: "userPic")
        return userPicImage
    }()
    
    lazy var countStackView: UIStackView = {
        let countStackView = UIStackView(arrangedSubviews: [postStackView, followerStackView, followingStackView])
        countStackView.axis = .horizontal
        countStackView.distribution = .equalCentering
        countStackView.spacing = 15
        return countStackView
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
        followingCount.font = .systemFont(ofSize: 16, weight: .bold)
        return followingCount
    }()
    
    lazy var followingText: UILabel = {
        let followingText = UILabel()
        followingText.text = "following"
        followingText.font = .systemFont(ofSize: 14, weight: .regular)
        return followingText
    }()
    
    lazy var userProfileStackView: UIStackView = {
        let userProfileStackView = UIStackView(arrangedSubviews: [userNickName, userIntro, userUrl])
        userProfileStackView.axis = .vertical
        userProfileStackView.spacing = 5
        return userProfileStackView
    }()
    
    lazy var userNickName: UILabel = {
        let userNickName = UILabel()
        userNickName.font = .systemFont(ofSize: 16, weight: .bold)
        return userNickName
    }()
    
    lazy var userIntro: UILabel = {
        let userIntro = UILabel()
        userIntro.font = .systemFont(ofSize: 14, weight: .regular)
        return userIntro
    }()
    
    lazy var userUrl: UILabel = {
        let userUrl = UILabel()
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            let statusBarHeight = self.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.top).offset(statusBarHeight)
        }
        
        self.addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.centerY.equalTo(userName)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }

        self.addSubview(userPicImage)
        userPicImage.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(14)
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(88)
            make.height.equalTo(88)
        }

        self.addSubview(countStackView)
        countStackView.snp.makeConstraints { make in
            make.leading.equalTo(userPicImage.snp.trailing).offset(41)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-8)
            make.centerY.equalTo(userPicImage)
        }

        self.addSubview(userProfileStackView)
        userProfileStackView.snp.makeConstraints { make in
            make.top.equalTo(userPicImage.snp.bottom).offset(20)
            make.leading.equalTo(userPicImage.snp.leading)
        }
    }
    
}
