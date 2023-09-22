//
//  MiddleBarView.swift
//  projectMVVM
//
//  Created by 김지훈 on 2023/09/22.
//

import UIKit
import SnapKit

class MiddleBarView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(middleBarStackView)
        middleBarStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        self.addSubview(navGalleryStackView)
        navGalleryStackView.snp.makeConstraints { make in
            make.top.equalTo(middleBarStackView.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
