//
//  KeyWordViewController.swift
//  Comon
//
//  Created by 김민섭 on 2023/11/25.
//

import UIKit

class KeyWordViewController: UIViewController {

    let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "키워드 입력"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let keywordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "키워드를 입력하세요"
        textField.layer.cornerRadius = 5 // 네모난 버튼을 만들기 위한 설정
        textField.backgroundColor = .lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let NextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20 // 네모난 버튼을 만들기 위한 설정
        return button
    }()
    
    let BackButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20 // 네모난 버튼을 만들기 위한 설정
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown // 시스템 배경색 설정
        
        view.addSubview(homeTitle)
        view.addSubview(keywordTextField)
        view.addSubview(NextButton)
        view.addSubview(BackButton)
        
        NextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        BackButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)

        addConstraints()
        configureNavbar()
        keywordTextField.becomeFirstResponder()
        
    }
    
    private func configureNavbar() {
        // UIBarButtonItem을 생성하고 시스템에서 제공하는 "X" 아이템을 설정
        let item1 = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(XButtonPressed))
        item1.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [item1]
    }
    
    // MARK: - 제약 조건 설정하기
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            keywordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            keywordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keywordTextField.widthAnchor.constraint(equalToConstant: 250), // 텍스트 필드의 너비를 조절
            keywordTextField.heightAnchor.constraint(equalToConstant: 70), // 텍스트 필드의 높이를 조절
        
            BackButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            BackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            BackButton.widthAnchor.constraint(equalToConstant: 70), // 버튼의 너비를 조절
            BackButton.heightAnchor.constraint(equalToConstant: 40), // 버튼의 높이를 조절
            
            NextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            NextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            NextButton.widthAnchor.constraint(equalToConstant: 70), // 버튼의 너비를 조절
            NextButton.heightAnchor.constraint(equalToConstant: 40), // 버튼의 높이를 조절
            
            homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - 버튼 클릭 시 실행될 함수 : 텍스트필드, alert, realm.add
    
    // 버튼을 눌렀을 때 실행되는 함수
    @objc func ButtonPressed() {
        print("edit button Pressed")
    }
    
    @objc func nextButtonPressed() {
        print("next button Pressed")
        let thirdVC = KeyWordViewController()
        let navController = UINavigationController(rootViewController: thirdVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func backButtonPressed() {
        print("back button Pressed")
        let secondVC = RoomViewController()
        let navController = UINavigationController(rootViewController: secondVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
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
    
}
