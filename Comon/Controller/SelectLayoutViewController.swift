import UIKit

class SelectLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "레이아웃 선택"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        let titleLabel2 = UILabel()
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.text = "* 개인 사진은 랜덤으로 선택됩니다"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 17)
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
        
        // Add circular buttons below each image
        addCircularButton(below: imageView1)
        addCircularButton(below: imageView2)
        addCircularButton(below: imageView3)
        addCircularButton(below: imageView4)
        
        let nextButton = UIButton(type: .custom)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setImage(UIImage(named: "next.png"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
                
        self.view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            imageView1.widthAnchor.constraint(equalToConstant: 70),
            imageView1.heightAnchor.constraint(equalToConstant: 200),
            
            imageView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 30),
            imageView2.widthAnchor.constraint(equalToConstant: 180),
            imageView2.heightAnchor.constraint(equalToConstant: 60),
            
            imageView3.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 90),
            imageView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            imageView3.widthAnchor.constraint(equalToConstant: 120),
            imageView3.heightAnchor.constraint(equalToConstant: 120),
            
            imageView4.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: 130),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: 40),
            imageView4.widthAnchor.constraint(equalToConstant: 120),
            imageView4.heightAnchor.constraint(equalToConstant: 200),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func addCircularButton(below imageView: UIImageView) {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15 // Adjust the corner radius as needed
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.white

        self.view.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])

        // Add any action you want for the button here
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private func configureNavbar() {
        // UIBarButtonItem을 생성하고 시스템에서 제공하는 "X" 아이템을 설정
        let item1 = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(XButtonPressed))
        item1.tintColor = UIColor.white
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
    
    @objc private func nextButtonTapped() {
        // "next.png" 버튼이 눌렸을 때 처리할 내용
        print("Next button tapped!")
        let nextVC = LayoutFrameViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}