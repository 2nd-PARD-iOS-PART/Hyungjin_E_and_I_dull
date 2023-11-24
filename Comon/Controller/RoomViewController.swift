//
//  RoomViewController.swift
//  Comon
//
//  Created by 김민섭 on 2023/11/25.
//

import UIKit

class RoomViewController: UIViewController {
    
    let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "인원 선택"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("4명", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10 // 네모난 버튼을 만들기 위한 설정
        button.imageView?.contentMode = .scaleAspectFit // 이미지의 콘텐츠 모드 설정
        return button
    }()
    
    let SecondButton: UIButton = {
       let button = UIButton()
       button.setTitle("", for: .normal)
       button.setTitleColor(.black, for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.backgroundColor = .white
       button.layer.cornerRadius = 10 // 네모난 버튼을 만들기 위한 설정
        button.setImage(UIImage(systemName: "lock"), for: .normal) // 자물쇠 이미지 설정
        button.tintColor = .black // 자물쇠 이미지의 색상을 검은색으로 설정
        button.imageView?.contentMode = .scaleAspectFit // 이미지의 콘텐츠 모드 설정
       return button
   }()
    
    let ThirdButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10 // 네모난 버튼을 만들기 위한 설정
        button.setImage(UIImage(systemName: "lock"), for: .normal) // 자물쇠 이미지 설정
        button.tintColor = .black // 자물쇠 이미지의 색상을 검은색으로 설정
        button.imageView?.contentMode = .scaleAspectFit // 이미지의 콘텐츠 모드 설정
        return button
    }()

    let FourthButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10 // 네모난 버튼을 만들기 위한 설정
        button.setImage(UIImage(systemName: "lock"), for: .normal) // 자물쇠 이미지 설정
        button.tintColor = .black // 자물쇠 이미지의 색상을 검은색으로 설정
        button.imageView?.contentMode = .scaleAspectFit // 이미지의 콘텐츠 모드 설정
        return button
    }()
    
    let NextButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "next.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background

        view.addSubview(homeTitle)
        view.addSubview(addButton)
        view.addSubview(SecondButton)
        view.addSubview(ThirdButton)
        view.addSubview(FourthButton)
        view.addSubview(NextButton)

        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        SecondButton.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        ThirdButton.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        FourthButton.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        NextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)

        configureNavbar() // 네비게이션 바 설정
        addConstraints()

        // Do any additional setup after loading the view.
    }
    
    private func configureNavbar() {
        // UIBarButtonItem을 생성하고 시스템에서 제공하는 "X" 아이템을 설정
        let item1 = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(XButtonPressed))
        item1.tintColor = UIColor.black
        navigationItem.rightBarButtonItems = [item1]
    }

    
    // MARK: - 제약 조건 설정하기
    func addConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            addButton.widthAnchor.constraint(equalToConstant: 100), // 버튼의 너비를 조절
            addButton.heightAnchor.constraint(equalToConstant: 100), // 버튼의 높이를 조절
            
            SecondButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            SecondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            SecondButton.widthAnchor.constraint(equalToConstant: 100), // 버튼의 너비를 조절
            SecondButton.heightAnchor.constraint(equalToConstant: 100), // 버튼의 높이를 조절
            
            ThirdButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            ThirdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            ThirdButton.widthAnchor.constraint(equalToConstant: 100), // 버튼의 너비를 조절
            ThirdButton.heightAnchor.constraint(equalToConstant: 100), // 버튼의 높이를 조절
            
            FourthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            FourthButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            FourthButton.widthAnchor.constraint(equalToConstant: 100), // 버튼의 너비를 조절
            FourthButton.heightAnchor.constraint(equalToConstant: 100), // 버튼의 높이를 조절
            
            NextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            NextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            NextButton.widthAnchor.constraint(equalToConstant: 70), // 버튼의 너비를 조절
            NextButton.heightAnchor.constraint(equalToConstant: 40), // 버튼의 높이를 조절
            
            homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - add 버튼 클릭 시 실행될 함수 : 텍스트필드, alert, realm.add
    @objc func addButtonPressed() {
        print("add button Pressed")
    }
    
    // edit 버튼을 눌렀을 때 실행되는 함수
    @objc func ButtonPressed() {
        print("edit button Pressed")
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
    
    @objc func nextButtonPressed() {
        print("next button Pressed")
        
        let thirdVC = KeyWordViewController()
        let navController = UINavigationController(rootViewController: thirdVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    
    }
}
