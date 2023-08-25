//
//  TodoViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/24.
//

import UIKit

class TodoViewController: UIViewController {
    
    //Todo 구조체 받아오기
    var todoData: Todo?

    //TableView선언
    let todoTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "할 일"
        self.navigationItem.rightBarButtonItem = self.rigthButton
        
        //TableView 정의, cell, 노출
        todoTableView.dataSource = self
        todoTableView.delegate = self
        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
        todoTableViewPrint()
    }
    
    //네비게이션바 오른쪽 아이템 "추가" 버튼 생성
    lazy var rigthButton: UIBarButtonItem = {
        let rightbutton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(moveAddView))
        return rightbutton
    }()
    
    //할 일 추가 페이지로 이동
    @objc func moveAddView() {
        navigationController?.pushViewController(TodoAddViewController(), animated: true)
    }
    
    //Table 위치
    func todoTableViewPrint() {
        view.addSubview(todoTableView)
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        todoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        todoTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        todoTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        todoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        todoTableView.backgroundColor = .systemGray6
        
    }

}

//Table 속성
extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.todofullList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = todoTableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.layer.cornerRadius = 10
        
        cell.todocellUISetting(TodoList.todofullList[indexPath.row])
        
        return cell
    }
}

//
extension TodoViewController: UITableViewDelegate {
    
}
