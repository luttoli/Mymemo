//
//  DoneTableViewCell.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/31.
//

import UIKit

class DoneTableViewCell: UITableViewCell {
    
    //DoneTableViewCell identifier 정의
    static let identifier = "DoneTableViewCell"
    
    //Todo 구조체 받아오기
    var todoData: Todo?
    
    //done title
    lazy var doneTitleLabel: UILabel = {
        let doneTitleLabel = UILabel()
        doneTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        doneTitleLabel.textColor = .black
        doneTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return doneTitleLabel
    }()
    
    //done date (완료시간)
    lazy var doneDateLabel: UILabel = {
        let doneDateLabel = UILabel()
        doneDateLabel.font = .systemFont(ofSize: 10, weight: .regular)
        doneDateLabel.textColor = .gray
        doneDateLabel.translatesAutoresizingMaskIntoConstraints = false
        return doneDateLabel
    }()
    
    //cell 스타일 지정?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        donecellPrint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //각 label 데이터 가져오기
    func donecellUISetting(_ _todo: Todo) {
        todoData = _todo
        guard let todoData else { return }
        doneTitleLabel.text = todoData.todoTitle
        doneDateLabel.text = todoData.todoDate
    }
    
    //각 label 위치 지정
    func donecellPrint() {
        contentView.addSubview(doneTitleLabel)
        contentView.addSubview(doneDateLabel)

        doneTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        doneTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        doneDateLabel.topAnchor.constraint(equalTo: doneTitleLabel.bottomAnchor, constant: 5).isActive = true
        doneDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
