//
//  ViewController.swift
//  Comon
//
//  Created by hyungjin kim on 2023/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "커몬"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(red: 1.0, green: 0.36, blue: 0.16, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()

    
    let roomAddButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "makeRoom")?.withRenderingMode(.alwaysOriginal) // 이미지 이름으로 변경해주세요
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
        return button
    }()
    
    
    
    let editButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "enterRoom")?.withRenderingMode(.alwaysOriginal) // 이미지 이름으로 변경해주세요
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background

        view.addSubview(homeTitle)
        view.addSubview(roomAddButton)
        view.addSubview(editButton)
        roomAddButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editData), for: .touchUpInside)
        addConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - 제약 조건 설정하기
    func addConstraints() {
        NSLayoutConstraint.activate([
            roomAddButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            roomAddButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            roomAddButton.widthAnchor.constraint(equalToConstant: 165), // 버튼의 너비를 조절
            roomAddButton.heightAnchor.constraint(equalToConstant: 240), // 버튼의 높이를 조절
            
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editButton.widthAnchor.constraint(equalToConstant: 165), // 버튼의 너비를 조절
            editButton.heightAnchor.constraint(equalToConstant: 240), // 버튼의 높이를 조절
            
            homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - add 버튼 클릭 시 실행될 함수 : 텍스트필드, alert, realm.add
    @objc func add() {
        print("add button Pressed")
        let secondVC = RoomViewController()
        let navController = UINavigationController(rootViewController: secondVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
     
    // edit 버튼을 눌렀을 때 실행되는 함수
    @objc func editData() {
        print("edit button Pressed")
    }
}

 
