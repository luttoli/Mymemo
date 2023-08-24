//
//  ImageData.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/23.
//

import UIKit
import Foundation

///스파르타 이미지가 그려지는 전체 뷰 영역
let spartaImageView: UIImageView = {
    let spartaImage = UIImageView()
    spartaImage.contentMode = .scaleAspectFit
    spartaImage.backgroundColor = .red
    spartaImage.clipsToBounds = false
    spartaImage.translatesAutoresizingMaskIntoConstraints = false
    
    return spartaImage
}()

///스파르타 이미지 url 가져와서 업데이트하기
func spartaImageSetting() {
    guard let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") else {
        return
    }
    
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    spartaImageView.image = image
                    print(image)
                }
            }
        }
    }
}

