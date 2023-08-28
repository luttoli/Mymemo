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
    
    private var todoFullList: [Todo] {
        return TodoList.todoLifeList + TodoList.todoWorkList
    }
    
    //네비게이션바 오른쪽 아이템 "추가" 버튼 생성
    lazy var rigthButton: UIBarButtonItem = {
        let rightbutton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(TodoViewController.addAlertView))
        return rightbutton
    }()
    
    //TableView 선언
    let todoTableView = UITableView()
    
    let todoTableSection: [String] = ["Work", "Life"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        self.navigationItem.title = "할 일"
        self.navigationItem.rightBarButtonItem = self.rigthButton
        
        //TableView 정의, cell, 노출
        todoTableView.dataSource = self
        todoTableView.delegate = self
        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
        todoTableViewPrint()
    }
    
    //
    let pickerList = ["Work", "Life"]
    var pickerView = UIPickerView()
    var focusedRow: Int = 0
    var selectedRow: Int = 0
    var typeValue = String()
    
    
    //할 일 추가하는 얼럿 노출
    @objc func addAlertView() {
        let addAlert = UIAlertController(title: "할 일 추가", message: "\n\n\n\n", preferredStyle: .alert)
        
        //TextField 추가
        addAlert.addTextField() { (tf) in
            tf.placeholder = "할 일을 입력하고 추가하세요."
        }
        
        //pickerView 추가
        pickerView.frame = CGRect(x: 0, y: 25, width: 270, height: 130)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let addCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        
        //얼럿의 추가버튼
        let addAddBtn = UIAlertAction(title: "추가", style: .default, handler: { (_) in
            
            //addTodoalert의 textFields[0]의 텍스트를 가져와라
            guard let addTodotext = addAlert.textFields?[0].text else { return }
            
            print("\(self.typeValue)")
//
//            //Todo 구조체가 가진 id에 fullList가 있는지 없는지 모르는 상태니까 해당 리스트의 마지막 id값에서 -1을 빼고 1을 더한 값을 id로, title에 addTodotext, iscompleted에 false를
//            let newlist = Todo(id: (TodoList.fullList.last?.id ?? -1) + 1, title: addTodotext, isCompleted: false, dodate: Date().dateTime())
//
//            //그걸 TodoList에 fullList 배열에 추가한다.
//            TodoList.fullList.append(newlist)
//
//            //추가 애니메이션?
//            self.todoTableView?.insertRows(at: [IndexPath(row: TodoList.fullList.count - 1, section: 0)], with: .automatic)
//
//            //확인할라고(나중에 지우지 뭐)
//            print(TodoList.fullList.last?.id ?? -1)
//            print("--------------------")
//            print("입력: \(addTodotext)")
//            print("--------------------")
//            print(TodoList.fullList)
//            print("--------------------")
//            print("새로운 입력: \(newlist)")
//            print("--------------------")
        })
        
        //버튼 노출
        addAlert.addAction(addCancelBtn)
        addAlert.addAction(addAddBtn)
        
        addAlert.view.addSubview(pickerView)
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
    
    //
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    //
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerList[row]
        }
    
    //
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        focusedRow = row
    }
    
    //
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 30
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
    
    //TableView Section의 Cell 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    //TableView Section 순서에 따라 리스트 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return TodoList.todoWorkList.count
        } else if section == 1 {
            return TodoList.todoLifeList.count
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
            cell.todocellUISetting(TodoList.todoWorkList[indexPath.row])
        } else if indexPath.section == 1 {
            cell.todocellUISetting(TodoList.todoLifeList[indexPath.row])
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
}
