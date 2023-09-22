//
//  PictureCell.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/09/20.
//

import UIKit
import SnapKit

class PictureCell: UICollectionViewCell {
    static let identifier = "PictureCell"
    
    lazy var pictureImage: UIImageView = {
        let pictureImage = UIImageView()
        pictureImage.image = UIImage(systemName: "photo")
        pictureImage.contentMode = .scaleToFill
        return pictureImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellPrint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }
    
    func cellPrint() {
        contentView.addSubview(pictureImage)

        pictureImage.snp.makeConstraints { make in
//            make.centerX.equalTo(contentView)
//            make.centerY.equalTo(contentView)
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
    }
}
