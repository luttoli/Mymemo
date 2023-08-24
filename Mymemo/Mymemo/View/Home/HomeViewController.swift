//
//  ViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/23.
//
// HomeViewController

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeUIStack: UIStackView = {
        let homeUISet = UIStackView(arrangedSubviews: [todoButton, doneButton, animalButton])
        homeUISet.axis = .vertical
        homeUISet.alignment = .center
        homeUISet.distribution = .fillEqually
        homeUISet.spacing = 20
        return homeUISet
    }()
    
    //
    lazy var todoButton: UIButton = {
//        let todobutton = UIButton(frame: CGRect(x: view.frame.width/2 - 75, y: 300, width: 150, height: 50), primaryAction: UIAction(handler: { _ in
//            self.navigationController?.pushViewController(TodoViewController(), animated: true)
//        }))
        let todobutton = UIButton()
        
        todobutton.setTitle("할 일 확인하기", for: .normal)
        todobutton.setTitleColor(.blue, for: .normal)
        todobutton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        todobutton.backgroundColor = .red
        return todobutton
    }()
    
    //
    lazy var doneButton: UIButton = {
        let donebutton = UIButton(frame: CGRect(x: view.frame.width/2 - 75, y: 400, width: 150, height: 50), primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(DoneViewController(), animated: true)
        }))
        
        donebutton.setTitle("완료한 일 확인하기", for: .normal)
        donebutton.setTitleColor(.blue, for: .normal)
        donebutton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        donebutton.backgroundColor = .blue
        return donebutton
    }()
    
    //
    lazy var animalButton: UIButton = {
        let animalbutton = UIButton(frame: CGRect(x: view.frame.width/2 - 75, y: 500, width: 150, height: 50), primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(AnimalViewController(), animated: true)
        }))
        
        animalbutton.setTitle("🐕", for: .normal)
        animalbutton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        animalbutton.backgroundColor = .yellow
        return animalbutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        spartaImagePrint()
        self.view.addSubview(homeUIStack)
//        self.view.addSubview(todoButton)
//        self.view.addSubview(doneButton)
//        self.view.addSubview(animalButton)
        
    }
    
    ///가져온 이미지를 어떻게 어디에 얼마나 그려줄지 정하고 업데이트 하기
    func spartaImagePrint() {
        spartaImageSetting()
        
        view.addSubview(spartaImageView)
        
        NSLayoutConstraint.activate([
//            spartaImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spartaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spartaImageView.widthAnchor.constraint(equalToConstant: 200),
            spartaImageView.heightAnchor.constraint(equalToConstant: 150),
            
            spartaImageView.topAnchor.constraint(equalTo: spartaImageView.topAnchor),
            spartaImageView.leadingAnchor.constraint(equalTo: spartaImageView.leadingAnchor),
            spartaImageView.trailingAnchor.constraint(equalTo: spartaImageView.trailingAnchor),
            spartaImageView.bottomAnchor.constraint(equalTo: spartaImageView.bottomAnchor),
        ])
    }
 
    ///
    
}
