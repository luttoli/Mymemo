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
//    static var todofullList: [Todo] = [
//        Todo(id: 0, todoType: "work", todoTitle: "코드로 UI 구현하기", todoIsCompleted: false, todoDate: "23년 08월 25일 (금) 14:00"),
//        Todo(id: 1, todoType: "life", todoTitle: "청소하기", todoIsCompleted: false, todoDate: "23년 08월 25일 (금) 14:00")
//    ]
    
    static var todoWorkList: [Todo] = [
        Todo(id: 0, todoType: "work", todoTitle: "코드로 UI 구현하기", todoIsCompleted: false, todoDate: "23년 08월 25일 (금) 14:00"),
        Todo(id: 1, todoType: "work", todoTitle: "기능 구현하기", todoIsCompleted: false, todoDate: "23년 08월 26일 (금) 14:00")
    ]
    
    static var todoLifeList: [Todo] = [
        Todo(id: 0, todoType: "life", todoTitle: "청소하기", todoIsCompleted: false, todoDate: "23년 08월 21일 (금) 14:00"),
        Todo(id: 1, todoType: "life", todoTitle: "빨래하기", todoIsCompleted: false, todoDate: "23년 08월 22일 (금) 14:00"),
        Todo(id: 2, todoType: "life", todoTitle: "약먹기", todoIsCompleted: false, todoDate: "23년 08월 23일 (금) 14:00")
    ]
    
    //완료 처리
    
    
    //완료 체크
    
    
    //완료 리스트
    
    
    //타이틀 수정
    
    
    //시간 수정
    
    
    //삭제
}
