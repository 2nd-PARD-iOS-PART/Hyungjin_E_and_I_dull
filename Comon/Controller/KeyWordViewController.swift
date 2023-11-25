//
//  KeyWordViewController.swift
//  short_test
//
//  Created by 김민섭 on 2023/11/25.
//

import UIKit

class KeyWordViewController: UIViewController {

    let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "키워드 입력"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.textBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let keywordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "키워드를 입력하세요"
        textField.layer.cornerRadius = 5 // 네모난 버튼을 만들기 위한 설정
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let textFieldImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "keyword")?.withRenderingMode(.alwaysOriginal) // 이미지 이름으로 변경해주세요
        return image
    }()
    
    let NextButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "next.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let BackButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Back.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background

        view.addSubview(homeTitle)
        view.addSubview(keywordTextField)
        view.addSubview(textFieldImage)
        view.addSubview(NextButton)
        view.addSubview(BackButton)
        
        NextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        BackButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)

        addConstraints()
        configureNavbar()
        keywordTextField.becomeFirstResponder()
        addDismissGesture()
    }
    
    private func configureNavbar() {
        // UIBarButtonItem을 생성하고 시스템에서 제공하는 "X" 아이템을 설정
        let item1 = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(XButtonPressed))
        item1.tintColor = UIColor.black
        navigationItem.rightBarButtonItems = [item1]
    }
    
    func addDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - 제약 조건 설정하기
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            keywordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            keywordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keywordTextField.widthAnchor.constraint(equalToConstant: 250), // 텍스트 필드의 너비를 조절
            keywordTextField.heightAnchor.constraint(equalToConstant: 70), // 텍스트 필드의 높이를 조절
            
            textFieldImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            textFieldImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldImage.widthAnchor.constraint(equalToConstant: 250), // 텍스트 필드의 너비를 조절
            textFieldImage.heightAnchor.constraint(equalToConstant: 70),
        
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
        let thirdVC = SelectLayoutViewController()
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
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
