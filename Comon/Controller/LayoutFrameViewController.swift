//
//  LayoutFrameViewController.swift
//  forfun
//
//  Created by 오성진 on 11/25/23.
//

import UIKit

class LayoutFrameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background

        let image = UIImageView(image: UIImage(named: "layoutframe.png"))
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        
        let imageEllipse = UIImageView(image: UIImage(named: "ellipse.png"))
        imageEllipse.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageEllipse)
        
        let imageFace = UIImageView(image: UIImage(named: "face.png"))
        imageFace.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageFace)
        
        configureNavbar()

        let imageReadyButton = UIButton()
        imageReadyButton.setImage(UIImage(named: "ready.png"), for: .normal)
        imageReadyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageReadyButton)
        
        imageReadyButton.addTarget(self, action: #selector(imageReadyButtonTapped), for: .touchUpInside)
        
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 350),
            image.heightAnchor.constraint(equalToConstant: 300),
            
            imageEllipse.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 120),
            imageEllipse.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageEllipse.widthAnchor.constraint(equalToConstant: 70),
            imageEllipse.heightAnchor.constraint(equalToConstant: 70),
            
            imageFace.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 130),
            imageFace.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageFace.widthAnchor.constraint(equalToConstant: 50),
            imageFace.heightAnchor.constraint(equalToConstant: 50),
            
            imageReadyButton.topAnchor.constraint(equalTo: imageFace.bottomAnchor, constant: 30),
            imageReadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageReadyButton.widthAnchor.constraint(equalToConstant: 110),
            imageReadyButton.heightAnchor.constraint(equalToConstant: 110)
        ])

    }
    
    private func configureNavbar() {
        // UIBarButtonItem을 생성하고 시스템에서 제공하는 "X" 아이템을 설정
        let item1 = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(XButtonPressed))
        item1.tintColor = UIColor.black
        navigationItem.rightBarButtonItems = [item1]
    }
    
    @objc func XButtonPressed() {
        print("X button Pressed")

        let alert = UIAlertController(title: "나가시겠어요?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "나가기", style: .default) { _ in
            let xVC = ViewController() // Assuming ViewController is not an optional type
            let navController = UINavigationController(rootViewController: xVC)
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true, completion: nil)
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @objc func imageReadyButtonTapped() {
        let thirdVC = CameraViewController()
        let navController = UINavigationController(rootViewController: thirdVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }


}
