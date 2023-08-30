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
        let detailremoveButton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(TodoViewController(), animated: true)
        }))
        detailremoveButton.setTitle("삭제하기", for: .normal)
        detailremoveButton.setTitleColor(.red, for: .normal)
        detailremoveButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        detailremoveButton.backgroundColor = .white
        detailremoveButton.translatesAutoresizingMaskIntoConstraints = false
        return detailremoveButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
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
