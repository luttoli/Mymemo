//
//  TodoDetailViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/30.
//

import UIKit

class TodoDetailViewController: UIViewController {
    
    //TodoDetailViewController identifier 정의
    static let identifier = "TodoDetailView"
    
    //Todo 구조체 받아오기
    var todoData: Todo?
    
    //네비게이션바 오른쪽 아이템 "수정" 버튼 생성
    lazy var rigthButton: UIBarButtonItem = {
        let rightbutton = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(TodoDetailViewController.editAlertView))
        return rightbutton
    }()
    
    //Picker 선언
    var pickerView = UIPickerView()
    let pickerList = ["선택해주세요.", "Work", "Life"]
    var focusedRow: Int = 0
    var selectedRow: Int = 0
    var typeValue = String()
    
    //할 일 추가하는 얼럿 노출
    @objc func editAlertView() {
        let editAlert = UIAlertController(title: "할 일 수정하기", message: "Todo 타입을 골라주세요.\n\n\n\n\n", preferredStyle: .alert)
        
        //
        editAlert.isModalInPresentation = true
        
        //TextField 추가
        editAlert.addTextField() { (tf) in
            tf.placeholder = "할 일을 입력하고 추가하세요."
        }
        
        //alert에 pickerView 추가
        editAlert.view.addSubview(pickerView)
        pickerView.frame = CGRect(x: 0, y: 50, width: 270, height: 100)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        //얼럿 취소 버튼
        let editCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        
        //얼럿 추가 버튼
        let editAddBtn = UIAlertAction(title: "수정", style: .default, handler: { [weak self] _ in
            
            //
            guard let self, let todoData else { return }
            if let title = editAlert.textFields?.first?.text,
               !title.isEmpty {
                TodoList.todoTitleEdit(todo: todoData, todoTitle: title)
                self.detailTitleLabel.text = title
            }

            //
            let selectedRow = self.pickerView.selectedRow(inComponent: 0)
            if selectedRow == 1 {
                self.typeValue = "Work"
            } else if selectedRow == 2 {
                self.typeValue = "Life"
            }
            
            //
            if !self.typeValue.isEmpty {
                TodoList.todoTypeEdit(todo: todoData, todoType: self.typeValue)
                self.detailTypeLabel.text = self.typeValue
            }
        })
        
        //버튼 노출
        editAlert.addAction(editCancelBtn)
        editAlert.addAction(editAddBtn)
        
        //피커뷰 항상 맨 위로
        pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        self.present(editAlert, animated: true)
    }
    
    //TodoDetailView todo type
    lazy var detailTypeLabel: UILabel = {
        let detailTypeLabel = UILabel()
        detailTypeLabel.font = .systemFont(ofSize: 15, weight: .regular)
        detailTypeLabel.textColor = .black
        detailTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailTypeLabel
    }()

    //TodoDetailView todo title
    lazy var detailTitleLabel: UILabel = {
        let detailTitleLabel = UILabel()
        detailTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        detailTitleLabel.textColor = .black
        detailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailTitleLabel
    }()
    
    //TodoDetailView todo isComplet
    lazy var detailIsCompletLabel: UILabel = {
        let detailIsCompletLabel = UILabel()
        detailIsCompletLabel.font = .systemFont(ofSize: 15, weight: .regular)
        detailIsCompletLabel.textColor = .black
        detailIsCompletLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailIsCompletLabel
    }()
    
    //삭제하기 버튼
    lazy var detailremoveButton: UIButton = {
        let detailremoveButton = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
                self?.removeButtonTapped()
            }))
        detailremoveButton.setTitle("삭제하기", for: .normal)
        detailremoveButton.setTitleColor(.red, for: .normal)
        detailremoveButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        detailremoveButton.backgroundColor = .white
        detailremoveButton.translatesAutoresizingMaskIntoConstraints = false
        return detailremoveButton
    }()
    
    //
    @objc func removeButtonTapped() {
        let removeAlert = UIAlertController(title: "할 일 삭제", message: "이 할 일을 삭제하시겠습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
            guard let self = self, let todoData = self.todoData else { return }
            
            // 데이터 소스에서 해당 할 일 삭제
            TodoList.todoRemove(todo: todoData)
            
            // 이전 화면으로 돌아가기
            self.navigationController?.popViewController(animated: true)
        }
        
        removeAlert.addAction(cancelAction)
        removeAlert.addAction(deleteAction)
        
        self.present(removeAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = self.rigthButton
        
        DetailViewPrint()
    }
    
    //
    func DetailViewPrint() {
        view.addSubview(detailTypeLabel)
        view.addSubview(detailTitleLabel)
        view.addSubview(detailIsCompletLabel)
        view.addSubview(detailremoveButton)
        
        if let todo = todoData {
            detailTypeLabel.text = todo.todoType
            
            detailTitleLabel.text = todo.todoTitle
            
            if todoData?.todoIsCompleted == true {
                detailIsCompletLabel.text = "완료함"
            } else {
                detailIsCompletLabel.text = "완료전"
            }
            
        }
        
        NSLayoutConstraint.activate([
            detailTypeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            detailTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailTitleLabel.topAnchor.constraint(equalTo: detailTypeLabel.bottomAnchor, constant: 20),
            detailTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailIsCompletLabel.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 20),
            detailIsCompletLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailremoveButton.topAnchor.constraint(equalTo: detailIsCompletLabel.bottomAnchor, constant: 50),
            detailremoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailremoveButton.widthAnchor.constraint(equalToConstant: 80),
            detailremoveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

//Picker 속성
extension TodoDetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
