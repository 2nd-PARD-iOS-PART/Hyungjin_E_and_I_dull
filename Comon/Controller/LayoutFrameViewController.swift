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
        
        
        configureNavbar()

        let imageReadyButton = UIButton()
        imageReadyButton.setImage(UIImage(named: "ready.png"), for: .normal)
        imageReadyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageReadyButton)
        
        imageReadyButton.addTarget(self, action: #selector(imageReadyButtonTapped), for: .touchUpInside)
        
        let imageView1 = UIImageView(image: UIImage(named: "frame1.png"))
        let imageView2 = UIImageView(image: UIImage(named: "frame2.png"))
        let imageView3 = UIImageView(image: UIImage(named: "frame3.png"))

        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false

        
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)

        let titleLabel2 = UILabel()
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.text = "* 모두가 준비 완료를 눌러야 시작할 수 있어요."
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel2.textColor = UIColor(red: 1.0, green: 0.36, blue: 0.16, alpha: 1.0)
        view.addSubview(titleLabel2)

        
        
        NSLayoutConstraint.activate([
        
            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView1.widthAnchor.constraint(equalToConstant: 170),
            imageView1.heightAnchor.constraint(equalToConstant: 230),
            
            imageView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 20),
            imageView2.widthAnchor.constraint(equalToConstant: 170),
            imageView2.heightAnchor.constraint(equalToConstant: 230),
            
            imageView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView3.widthAnchor.constraint(equalToConstant: 160),
            imageView3.heightAnchor.constraint(equalToConstant: 70),
            
            
            imageReadyButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -350),
            imageReadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageReadyButton.widthAnchor.constraint(equalToConstant: 200),
            imageReadyButton.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
