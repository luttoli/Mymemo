//
//  AnimalViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/24.
//

import UIKit

class AnimalViewController: UIViewController {
    
    //네비게이션바 오른쪽 아이템 "새로고침" 버튼 생성
    lazy var rigthButton: UIBarButtonItem = {
        let rigthButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(AnimalViewController.imageUrl))
        return rigthButton
    }()
    
    let urlImageView: UIImageView = {
        let urlImageView = UIImageView()
        urlImageView.contentMode = .scaleAspectFit
        urlImageView.backgroundColor = .white
        return urlImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "반려동물"
        self.navigationItem.rightBarButtonItem = self.rigthButton
        
        view.addSubview(urlImageView)

        urlImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        
        imageUrl()
    }
    
    //이미지 가져오기
    @objc func imageUrl() {
        // 이미지 URL
        let imageUrlString = "https://api.thecatapi.com/v1/images/search"
        
        // URLSession을 사용하여 이미지 데이터 가져오기
        if let imageUrl = URL(string: imageUrlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: imageUrl) { [weak self] data, response, error in
                if let error = error {
                    print("Error fetching image:", error)
                    return
                }
                
                if let data = data {
                    do {
                        // image는 urlData가 가진 데이터 중 url의 주소고 그걸 뿌릴거다?
                        let images = try JSONDecoder().decode([urlData].self, from: data)
                        if let imageUrl = URL(string: images.first?.url ?? "") {
                            if let imageData = try? Data(contentsOf: imageUrl) {
                                DispatchQueue.main.async {
                                    self?.urlImageView.image = UIImage(data: imageData)
                                }
                            }
                        }
                    } catch {
                        print("Error decoding JSON:", error)
                    }
                }
            }
            task.resume()
        }
    }
}
