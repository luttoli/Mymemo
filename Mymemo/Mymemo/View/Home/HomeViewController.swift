//
//  ViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/23.
//
// HomeViewController

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    lazy var homeUIStackView: UIStackView = {
        let homeUIStackView = UIStackView(arrangedSubviews: [
            spartaImageView, todoButton, doneButton, animalButton, profileButton
        ])
        homeUIStackView.axis = .vertical
        homeUIStackView.spacing = 20
        return homeUIStackView
    }()
    
    //스파르타 이미지 세팅
    lazy var spartaImageView: UIImageView = {
        let spartaImageView = UIImageView()
        spartaImageView.contentMode = .scaleAspectFit
        spartaImageView.backgroundColor = .white
        return spartaImageView
    }()
    
    //할 일 확인하기 버튼 세팅
    lazy var todoButton: UIButton = {
        let todoButton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(TodoViewController(), animated: true)
        }))
        todoButton.setTitle("할 일 확인하기", for: .normal)
        todoButton.setTitleColor(.blue, for: .normal)
        todoButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        todoButton.backgroundColor = .white
        return todoButton
    }()
    
    //완료한 일 확인하기 버튼 세팅
    lazy var doneButton: UIButton = {
        let doneButton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(DoneViewController(), animated: true)
        }))
        doneButton.setTitle("완료한 일 확인하기", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        doneButton.backgroundColor = .white
        return doneButton
    }()
    
    //동물 버튼 세팅
    lazy var animalButton: UIButton = {
        let animalButton = UIButton(primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(AnimalViewController(), animated: true)
        }))
        animalButton.setTitle("🐕", for: .normal)
        animalButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        animalButton.backgroundColor = .white
        return animalButton
    }()
    
    lazy var profileButton: UIButton = {
        let profileButton = UIButton(type: .system)
        profileButton.addTarget(self, action: #selector(profileButtonClicked), for: .touchUpInside)
        profileButton.setTitle("ProfileDesignViewController", for: .normal)
        profileButton.setTitleColor(.blue, for: .normal)
        profileButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        profileButton.backgroundColor = .white
        return profileButton
    }()
    
    @objc func profileButtonClicked() {
        let goProfile = ProfileDesignViewController()
        goProfile.modalPresentationStyle = .fullScreen
        present(goProfile, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        homeUIPrint()
    }
    
    func homeUIPrint() {
        view.addSubview(homeUIStackView)
        
        homeUIStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
        spartaImagePrint()
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
        
        spartaImageView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(150)
        }
    }
}
