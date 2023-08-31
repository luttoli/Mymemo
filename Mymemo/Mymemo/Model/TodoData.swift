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
        Todo(id: 0, todoType: "Life", todoTitle: "청소하기", todoIsCompleted: true, todoDate: "23년 8월 21일 (금) 14:00"),
        Todo(id: 1, todoType: "Life", todoTitle: "빨래하기", todoIsCompleted: false, todoDate: "23년 8월 22일 (금) 14:00"),
        Todo(id: 2, todoType: "Life", todoTitle: "약먹기", todoIsCompleted: false, todoDate: "23년 8월 23일 (금) 14:00"),
        Todo(id: 3, todoType: "Work", todoTitle: "코드로 UI 구현하기", todoIsCompleted: false, todoDate: "23년 8월 25일 (금) 14:00"),
        Todo(id: 4, todoType: "Work", todoTitle: "기능 구현하기", todoIsCompleted: false, todoDate: "23년 8월 26일 (금) 14:00"),
        Todo(id: 5, todoType: "Work", todoTitle: "과제하기", todoIsCompleted: false, todoDate: "23년 8월 26일 (금) 14:00")
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
    static func completed(todo: Todo, todoIsCompleted: Bool, todoDate: String) {
        for index in 0 ..< todoFullList.count {
            if todoFullList[index].id == todo.id {
                todoFullList[index].todoIsCompleted = todoIsCompleted
                todoFullList[index].todoDate = todoDate
            }
        }
    }
    
    //완료 체크
    static func todoEditCompleted(todo: Todo, todoIsCompleted: Bool) {
        for index in 0 ..< todoFullList.count {
            if todoFullList[index].id == todo.id {
                todoFullList[index].todoIsCompleted = todoIsCompleted
            }
        }
    }
    
    //완료 리스트
    static func todoCompletList() -> [Todo] {
        return todoFullList.filter { $0.todoIsCompleted == true }
    }
    
    //todo title 수정
    static func todoTitleEdit(todo: Todo, todoTitle: String) {
        for index in 0 ..< todoFullList.count {
            if todoFullList[index].id == todo.id {
                todoFullList[index].todoTitle = todoTitle
            }
        }
    }
    
    //todo type 수정
    static func todoTypeEdit(todo: Todo, todoType: String) {
        for index in 0 ..< todoFullList.count {
            if todoFullList[index].id == todo.id {
                todoFullList[index].todoType = todoType
            }
        }
    }
    
    //시간 수정
    
    
    //삭제
    static func todoRemove(todo: Todo) {
        todoFullList.removeAll(where: { $0.id == todo.id })
    }
}
