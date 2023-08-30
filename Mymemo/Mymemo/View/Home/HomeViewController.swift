//
//  ViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/23.
//
// HomeViewController

import UIKit

class HomeViewController: UIViewController {
    
    //스파르타 이미지 세팅
    let spartaImageView: UIImageView = {
        let spartaImage = UIImageView()
        spartaImage.contentMode = .scaleAspectFit
        spartaImage.backgroundColor = .white
        spartaImage.translatesAutoresizingMaskIntoConstraints = false
        return spartaImage
    }()
    
    //할 일 확인하기 버튼 세팅
    lazy var todoButton: UIButton = {
        let todobutton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(TodoViewController(), animated: true)
        }))
        todobutton.setTitle("할 일 확인하기", for: .normal)
        todobutton.setTitleColor(.blue, for: .normal)
        todobutton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        todobutton.backgroundColor = .white
        todobutton.translatesAutoresizingMaskIntoConstraints = false
        return todobutton
    }()
    
    //완료한 일 확인하기 버튼 세팅
    lazy var doneButton: UIButton = {
        let donebutton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(DoneViewController(), animated: true)
        }))
        donebutton.setTitle("완료한 일 확인하기", for: .normal)
        donebutton.setTitleColor(.blue, for: .normal)
        donebutton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        donebutton.backgroundColor = .white
        donebutton.translatesAutoresizingMaskIntoConstraints = false
        return donebutton
    }()
    
    //동물 버튼 세팅
    lazy var animalButton: UIButton = {
        let animalbutton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(AnimalViewController(), animated: true)
        }))
        animalbutton.setTitle("🐕", for: .normal)
        animalbutton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        animalbutton.backgroundColor = .white
        animalbutton.translatesAutoresizingMaskIntoConstraints = false
        return animalbutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        spartaImagePrint()
        homeViewPrint()
    }
    
    //이미지 가져와서 업데이트 준비, 가져온 이미지를 어떻게 어디에 얼마나 그려줄지 정하고 업데이트 하기
    func spartaImagePrint() {
        guard let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") else {
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.spartaImageView.image = image
                        print(image)
                    }
                }
            }
        }
        
        view.addSubview(spartaImageView)
        
        NSLayoutConstraint.activate([
            spartaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spartaImageView.widthAnchor.constraint(equalToConstant: 300),
            spartaImageView.heightAnchor.constraint(equalToConstant: 150),
            
            spartaImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            spartaImageView.leadingAnchor.constraint(equalTo: spartaImageView.leadingAnchor),
            spartaImageView.trailingAnchor.constraint(equalTo: spartaImageView.trailingAnchor),
            spartaImageView.bottomAnchor.constraint(equalTo: spartaImageView.bottomAnchor),
        ])
    }
    
    //세개의 버튼 위치와 크기 정해서 출력하기
    func homeViewPrint() {
        view.addSubview(todoButton)
        view.addSubview(doneButton)
        view.addSubview(animalButton)
        
        NSLayoutConstraint.activate([
            todoButton.topAnchor.constraint(equalTo: spartaImageView.bottomAnchor, constant: 10),
            todoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoButton.widthAnchor.constraint(equalToConstant: 150),
            todoButton.heightAnchor.constraint(equalToConstant: 50),
            
            doneButton.topAnchor.constraint(equalTo: todoButton.bottomAnchor, constant: 10),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 150),
            doneButton.heightAnchor.constraint(equalToConstant: 50),
            
            animalButton.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 10),
            animalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animalButton.widthAnchor.constraint(equalToConstant: 150),
            animalButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
