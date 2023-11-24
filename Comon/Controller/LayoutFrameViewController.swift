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
        view.backgroundColor = .white
        
        let image = UIImageView(image: UIImage(named: "layoutframe.png"))
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        
        let imageEllipse = UIImageView(image: UIImage(named: "ellipse.png"))
        imageEllipse.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageEllipse)
        
        let imageFace = UIImageView(image: UIImage(named: "face.png"))
        imageFace.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageFace)
        
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
    
    @objc func imageReadyButtonTapped() {
            print("dd")
        }


}
