//
//  TodoTableViewCell.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/25.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    static let identifier = "TodoTableViewCell"
    
    var todo: Todo?
    
    lazy var todoCellStackView: UIStackView = {
        let todoCellStackView = UIStackView(arrangedSubviews: [todoTitleLabel, todoCompletedButton])
        todoCellStackView.axis = .horizontal
        todoCellStackView.alignment = .center
        todoCellStackView.distribution = .equalSpacing
        todoCellStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return todoCellStackView
    }()
    
    lazy var todoTitleLabel: UILabel = {
        let todoTitleLabel = UILabel()
        todoTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        todoTitleLabel.textColor = .black
        return todoTitleLabel
    }()
    
    lazy var todoCompletedButton: UISwitch = {
        let todoCompletedButton = UISwitch()
        return todoCompletedButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellStackViewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func todoCellSettion(_ _todo: Todo) {
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
    
    func cellStackViewSetting() {
        self.addSubview(todoCellStackView)
        
        todoCellStackView.translatesAutoresizingMaskIntoConstraints = false
        todoCellStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        todoCellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
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
