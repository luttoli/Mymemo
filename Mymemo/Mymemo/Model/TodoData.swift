//
//  memoData.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/23.
//

import Foundation

struct Todo {
    var id: Int
    var todoType: String
    var todoTitle: String
    var todoIsCompleted: Bool
    var todoDate: String
}

struct TodoList {
    //전체 리스트
    static var todofullList: [Todo] = [
        Todo(id: 0, todoType: "work", todoTitle: "코드로 UI 구현하기", todoIsCompleted: false, todoDate: "23년 08월 25일 (금) 14:00"),
        Todo(id: 1, todoType: "life", todoTitle: "청소하기", todoIsCompleted: false, todoDate: "23년 08월 25일 (금) 14:00")
    ]
    
    //완료 처리
    
    
    //완료 체크
    
    
    //완료 리스트
    
    
    //타이틀 수정
    
    
    //시간 수정
    
    
    //삭제
}
