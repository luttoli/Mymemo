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
    var todo: Todo?
    
    //Todo 할 일 제목 설정
    lazy var todoTitleLabel: UILabel = {
        let todoTitleLabel = UILabel()
        todoTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        todoTitleLabel.textColor = .black
        todoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return todoTitleLabel
    }()
    
    //Todo 할 일 체크 설정
    lazy var todoCompletedButton: UISwitch = {
        let todoCompletedButton = UISwitch()
        todoCompletedButton.translatesAutoresizingMaskIntoConstraints = false
        return todoCompletedButton
    }()
    
    //cell 스타일 지정?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        todocellPrint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Todo 할 일 제목 스타일 지정
    func todocellUISetting(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        if todo.todoIsCompleted {
            todoTitleLabel.text = nil
            todoTitleLabel.attributedText = todo.todoTitle.strikeThrough()
        } else {
            todoTitleLabel.attributedText = nil
            todoTitleLabel.text = todo.todoTitle
        }
        
    }
    
    //cell 그리기
    func todocellPrint() {
        self.addSubview(todoTitleLabel)
        self.addSubview(todoCompletedButton)

        todoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        todoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        todoCompletedButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        todoCompletedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
