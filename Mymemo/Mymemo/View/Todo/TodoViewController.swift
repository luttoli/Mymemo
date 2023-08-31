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
    
    //네비게이션바 오른쪽 아이템 "추가" 버튼 생성
    lazy var rigthButton: UIBarButtonItem = {
        let rightbutton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(TodoViewController.addAlertView))
        return rightbutton
    }()
    
    //TableView 선언
    let todoTableView = UITableView()
    
    //TableView Section 나누기
    let todoTableSection: [String] = ["Work", "Life"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        self.navigationItem.title = "할 일"
        self.navigationItem.rightBarButtonItem = self.rigthButton
        
        //TableView 정의, cell, 노출
        todoTableView.dataSource = self
        todoTableView.delegate = self
        todoTableView.reloadData()
        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
        todoTableViewPrint()
    }
    
    //???
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        todoTableView.reloadData()
    }
    
    //Picker 선언
    var pickerView = UIPickerView()
    let pickerList = ["선택해주세요.", "Work", "Life"]
    var focusedRow: Int = 0
    var selectedRow: Int = 0
    var typeValue = String()
    
    //할 일 추가하는 얼럿 노출
    @objc func addAlertView() {
        let addAlert = UIAlertController(title: "할 일 추가", message: "Todo 타입을 골라주세요.\n\n\n\n\n", preferredStyle: .alert)
        
        //
        addAlert.isModalInPresentation = true
        
        //TextField 추가
        addAlert.addTextField() { (tf) in
            tf.placeholder = "할 일을 입력하고 추가하세요."
        }
        
        //alert에 pickerView 추가
        addAlert.view.addSubview(pickerView)
        pickerView.frame = CGRect(x: 0, y: 50, width: 270, height: 100)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        //얼럿 취소 버튼
        let addCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        
        //얼럿 추가 버튼
        let addAddBtn = UIAlertAction(title: "추가", style: .default, handler: { (_) in
            
            //addTodoalert의 textFields[0]의 텍스트를 가져와라
            guard let addTodotext = addAlert.textFields?[0].text else { return }
            
            //Todo 구조체가 가진 id에 fullList가 있는지 없는지 모르는 상태니까 해당 리스트의 마지막 id값에서 -1을 빼고 1을 더한 값을 id로, title에 addTodotext, iscompleted에 false를
            let newList = Todo(id: (TodoList.todoFullList.last?.id ?? -1) + 1, todoType: self.typeValue, todoTitle: addTodotext, todoIsCompleted: false, todoDate: "")
            
            //그걸 TodoList에 fullList 배열에 추가한다.
            TodoList.todoFullList.append(newList)
            
            //추가할 때마다 테이블뷰업데이트
            self.todoTableView.reloadData()
        })
        
        //버튼 노출
        addAlert.addAction(addCancelBtn)
        addAlert.addAction(addAddBtn)
        
        //피커뷰 항상 맨 위로
        pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        self.present(addAlert, animated: true)
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

//Picker 속성
extension TodoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //피커뷰 몇개인지, 2개면 옆에 하나 더생김
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //피커뷰 목록 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    //피커뷰 목록 타이틀
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    //선택한 값 정의
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 1 {
            typeValue = "Work"
        } else if row == 2 {
            typeValue = "Life"
        }
    }
    
    //높이?
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 30
    }
    
    //피커뷰 폰트
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = pickerList[row]
        label.textAlignment = .center
        return label
    }
}

//Table 속성
extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    
    //TableView Section 개수를 todoTableSection 만큼
    func numberOfSections(in tableView: UITableView) -> Int {
        return todoTableSection.count
    }
    
    //section마다의 타이틀?
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return todoTableSection[section]
    }
    
    //TableView Section 순서에 따라 리스트 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return TodoList.todoWorkList().count
        } else if section == 1 {
            return TodoList.todoLifeList().count
        } else {
            return 0
        }
    }
    
    //TableView Section의 순서에 따라 항목의 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = todoTableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        //아이폰 설정 화면처럼 뭉탱이 cell 둥글게 하고시푼데
        
        //section마다 출력할 리스트
        if indexPath.section == 0 {
            cell.todocellUISetting(TodoList.todoWorkList()[indexPath.row])
        } else if indexPath.section == 1 {
            cell.todocellUISetting(TodoList.todoLifeList()[indexPath.row])
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    //TableView Section의 Cell 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedTodo: Todo
        
        if indexPath.section == 0 {
            selectedTodo = TodoList.todoWorkList()[indexPath.row]
        } else if indexPath.section == 1 {
            selectedTodo = TodoList.todoLifeList()[indexPath.row]
        } else {
            return
        }
        
        let detailView = TodoDetailViewController()
        detailView.todoData = selectedTodo
        navigationController?.pushViewController(detailView, animated: true)
    }
}
