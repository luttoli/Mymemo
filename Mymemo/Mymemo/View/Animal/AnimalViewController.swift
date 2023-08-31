//
//  AnimalViewController.swift
//  Mymemo
//
//  Created by 김지훈 on 2023/08/24.
//

import UIKit

class AnimalViewController: UIViewController {
    
    let urlImageView: UIImageView = {
        let urlImageView = UIImageView()
        urlImageView.contentMode = .scaleAspectFit
        urlImageView.backgroundColor = .white
        urlImageView.translatesAutoresizingMaskIntoConstraints = false
        return urlImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(urlImageView)
        urlImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        urlImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        imageUrl()
    }
    
    //
    func imageUrl() {
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
