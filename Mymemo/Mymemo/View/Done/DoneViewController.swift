//
//  DoneViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/24.
//

import UIKit

class DoneViewController: UIViewController {
    
    //
    var todoData: Todo?
    
    //네비게이션바 오른쪽 아이템 "추가" 버튼 생성
    lazy var rigthButton: UIBarButtonItem = {
        let rigthButton = UIBarButtonItem(title: "\(TodoList.todoCompletList().count)개", style: .plain, target: self, action: nil)
        return rigthButton
    }()
    
    let doneTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "완료한 일"
        self.navigationItem.rightBarButtonItem = self.rigthButton
        
        doneTableView.dataSource = self
        doneTableView.delegate = self
        doneTableView.reloadData()
        doneTableView.register(DoneTableViewCell.self, forCellReuseIdentifier: DoneTableViewCell.identifier)
        doneTableView.rowHeight = UITableView.automaticDimension
        doneTableViewPrint()
        
    }
    
    //Table 위치
    func doneTableViewPrint() {
        view.addSubview(doneTableView)
        doneTableView.translatesAutoresizingMaskIntoConstraints = false
        doneTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        doneTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        doneTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        doneTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        doneTableView.backgroundColor = .systemGray6
    }

}

//Table 속성
extension DoneViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.todoCompletList().count
    }
    
    //TableView Section의 순서에 따라 항목의 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = doneTableView.dequeueReusableCell(withIdentifier: "DoneTableViewCell", for: indexPath) as? DoneTableViewCell else {
            return UITableViewCell()
        }
        
        cell.donecellUISetting(TodoList.todoCompletList()[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
