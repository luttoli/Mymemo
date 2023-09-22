//
//  ProfileDesignViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/09/15.
//

import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController, UITextViewDelegate {
    
    var userProFileViewModel: UserProfileViewModel!
    
    lazy var userProfileView: UserProfileView = {
        let userProfileView = UserProfileView()
        return userProfileView
    }()
    
    lazy var middleBarView: MiddleBarView = {
        let middleBarView = MiddleBarView()
        return middleBarView
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
        
        userProfileViewPrint()
        middleBarViewPrint()
        pictureCollectionViewPrint()
        bottomNavBarPrint()
        goBackGesture()
    }
    
    func userProfileViewPrint() {
        view.addSubview(userProfileView)
        userProfileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        userProFileViewModel = UserProfileViewModel(userProfile: UserProfile(userName: "nabaecamp", postCount: 7, followerCount: 110, followingCount: 220, userNickName: "르탄이", userIntro: "iOS Developer 🍎", userUrl: "spartacodingclub.kr")
        )
        
        userProfileView.userName.text = userProFileViewModel.pageName
        userProfileView.postCount.text = userProFileViewModel.postCountText
        userProfileView.followerCount.text = userProFileViewModel.followerCountText
        userProfileView.followingCount.text = userProFileViewModel.followingCountText
        userProfileView.userNickName.text = userProFileViewModel.userNickNameText
        userProfileView.userIntro.text = userProFileViewModel.userIntroText
        userProfileView.userUrl.text = userProFileViewModel.userUrlText
    }
    
    func middleBarViewPrint() {
        view.addSubview(middleBarView)
        middleBarView.snp.makeConstraints { make in
            make.top.equalTo(userProfileView.userUrl.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    func pictureCollectionViewPrint() {
        view.addSubview(pictureCollectionView)
        pictureCollectionView.snp.makeConstraints { make in
            make.top.equalTo(middleBarView.gridLineView.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func bottomNavBarPrint() {
        view.addSubview(bottomNavBarStackView)
        bottomNavBarStackView.snp.makeConstraints { make in
            make.top.equalTo(pictureCollectionView.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
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
