//
//  Extension.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/25.
//

import UIKit
import Foundation

//취소선 & 폰트컬러 회색
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

//날짜
extension Date {
    func dateTime() -> String{
        let formatter = DateFormatter() //객체 생성
        formatter.dateFormat = "M월 dd일 (EEEEE) HH:mm" //데이터 포멧 설정
        let str = formatter.string(from: Date()) //문자열로 바꾸기
        return str
    }
}
