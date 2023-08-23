//
//  ViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/23.
//
// HomeViewController

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        spartaImagePrint()
    }
    
    ///가져온 이미지를 어떻게 어디에 얼마나 그려줄지 정하고 업데이트 하기
    func spartaImagePrint() {
        spartaImageSetting()
        
        view.addSubview(spartaImageView)
        
        NSLayoutConstraint.activate([
            spartaImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spartaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spartaImageView.widthAnchor.constraint(equalToConstant: 200),
            spartaImageView.heightAnchor.constraint(equalToConstant: 150),
            
            spartaImageView.topAnchor.constraint(equalTo: spartaImageView.topAnchor),
            spartaImageView.leadingAnchor.constraint(equalTo: spartaImageView.leadingAnchor),
            spartaImageView.trailingAnchor.constraint(equalTo: spartaImageView.trailingAnchor),
            spartaImageView.bottomAnchor.constraint(equalTo: spartaImageView.bottomAnchor),
        ])
    }
 
    ///
    
}
