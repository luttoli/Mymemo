//
//  TodoTableViewCell.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/25.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    //TodoTableViewCell identifier 정의
    static let identifier = "TodoTableViewCell"
    
    //Todo 구조체 받아오기
    var todoData: Todo?
    
    //Todo 할 일 제목 설정
    lazy var todoTitleLabel: UILabel = {
        let todoTitleLabel = UILabel()
        todoTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        todoTitleLabel.textColor = .black
        todoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return todoTitleLabel
    }()
    
    //Todo 할 일 체크 버튼 설정
    lazy var todoCompletedButton: UISwitch = {
        let todoCompletedButton = UISwitch()
        
        todoCompletedButton.isOn = false
        todoCompletedButton.addTarget(self, action: #selector(tapSwitchButton(sender:)), for: UIControl.Event.valueChanged)
        
        todoCompletedButton.translatesAutoresizingMaskIntoConstraints = false
        return todoCompletedButton
    }()
    
    //Todo cell SwitchButton 클릭 이벤트
    @objc func tapSwitchButton(sender: UISwitch) {
        guard let todoData = self.todoData else {
            return
        }
        
        if sender.isOn {
            todoTitleLabel.text = nil
            todoTitleLabel.attributedText = todoData.todoTitle.strikeThrough()
            
            self.todoData?.todoIsCompleted = true
            self.todoData?.todoDate = Date().dateTime()
            TodoList.completed(todo: todoData, todoIsCompleted: true, todoDate: Date().dateTime())
        } else {
            todoTitleLabel.attributedText = nil
            todoTitleLabel.text = todoData.todoTitle
            
            self.todoData?.todoIsCompleted = false
            self.todoData?.todoDate = Date().dateTime()
            TodoList.completed(todo: todoData, todoIsCompleted: false, todoDate: Date().dateTime())
        }
        
        if let tableView = superview as? UITableView,
           let indexPath = tableView.indexPath(for: self) {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    //cell 스타일 지정?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        todocellPrint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Todo 할 일 타이틀 스타일 지정
    func todocellUISetting(_ _todo: Todo) {
        todoData = _todo
        guard let todoData else { return }
        if todoData.todoIsCompleted {
            todoTitleLabel.text = nil
            todoTitleLabel.attributedText = todoData.todoTitle.strikeThrough()
        } else {
            todoTitleLabel.attributedText = nil
            todoTitleLabel.text = todoData.todoTitle
        }
        todoCompletedButton.isOn = todoData.todoIsCompleted
    }
    
    //cell 그리기 (contentView: 셀 컨텐츠 영역 내 버튼이 추가되도록)
    func todocellPrint() {
        contentView.addSubview(todoTitleLabel)
        contentView.addSubview(self.todoCompletedButton)

        todoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        todoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        todoCompletedButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        todoCompletedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
