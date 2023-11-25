import UIKit

class SelectLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "레이아웃 선택"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor.textBlack
        view.addSubview(titleLabel)
        
        let titleLabel2 = UILabel()
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.text = "* 개인 사진은 랜덤으로 선택됩니다"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel2.textColor = UIColor.textBlack
        view.addSubview(titleLabel2)
        
        configureNavbar()
        
        let imageView1 = UIImageView(image: UIImage(named: "image1.png"))
        let imageView2 = UIImageView(image: UIImage(named: "image2.png"))
        let imageView3 = UIImageView(image: UIImage(named: "image3.png"))
        let imageView4 = UIImageView(image: UIImage(named: "image4.png"))
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        imageView4.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        self.view.addSubview(imageView4)
        
        
        let nextButton = UIButton(type: .custom)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setImage(UIImage(named: "next.png"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
                
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "Back.png"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
        self.view.addSubview(backButton)

        
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView1.widthAnchor.constraint(equalToConstant: 170),
            imageView1.heightAnchor.constraint(equalToConstant: 230),
            
            imageView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 20),
            imageView2.widthAnchor.constraint(equalToConstant: 170),
            imageView2.heightAnchor.constraint(equalToConstant: 230),
            
            imageView3.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 30),
            imageView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView3.widthAnchor.constraint(equalToConstant: 170),
            imageView3.heightAnchor.constraint(equalToConstant: 230),
            
            imageView4.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: 30),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: 20),
            imageView4.widthAnchor.constraint(equalToConstant: 170),
            imageView4.heightAnchor.constraint(equalToConstant: 230),
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 60),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 60)
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
    
    @objc private func buttonTapped() {
        // Handle button tap
        print("Button tapped!")
    }
    
    @objc func backButtonPressed() {
        print("back button Pressed")
        let secondVC = KeyWordViewController()
        let navController = UINavigationController(rootViewController: secondVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc private func nextButtonTapped() {
        // "next.png" 버튼이 눌렸을 때 처리할 내용
        print("Next button tapped!")
        let nextVC = LayoutFrameViewController()
        let navController = UINavigationController(rootViewController: nextVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
}
