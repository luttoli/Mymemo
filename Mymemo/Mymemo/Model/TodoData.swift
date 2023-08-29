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
    static var todoFullList: [Todo] = [
        Todo(id: 0, todoType: "Life", todoTitle: "청소하기", todoIsCompleted: false, todoDate: "23년 08월 21일 (금) 14:00"),
        Todo(id: 1, todoType: "Life", todoTitle: "빨래하기", todoIsCompleted: false, todoDate: "23년 08월 22일 (금) 14:00"),
        Todo(id: 2, todoType: "Life", todoTitle: "약먹기", todoIsCompleted: false, todoDate: "23년 08월 23일 (금) 14:00"),
        Todo(id: 3, todoType: "Work", todoTitle: "코드로 UI 구현하기", todoIsCompleted: false, todoDate: "23년 08월 25일 (금) 14:00"),
        Todo(id: 4, todoType: "Work", todoTitle: "기능 구현하기", todoIsCompleted: false, todoDate: "23년 08월 26일 (금) 14:00"),
        Todo(id: 5, todoType: "Work", todoTitle: "과제하기", todoIsCompleted: false, todoDate: "23년 08월 26일 (금) 14:00")
    ]
    
    //Work 선택한 리스트
    static func todoWorkList() -> [Todo] {
        return todoFullList.filter { $0.todoType == "Work" }
    }
    
    //List 선택한 리스트
    static func todoLifeList() -> [Todo] {
        return todoFullList.filter { $0.todoType == "Life" }
    }
    
    //완료 처리
    
    
    //완료 체크
    
    
    //완료 리스트
    
    
    //타이틀 수정
    
    
    //시간 수정
    
    
    //삭제
}
