//
//  FinalViewController.swift
//  Comon
//
//  Created by 오성진 on 11/25/23.
//

import UIKit

class FinalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let downloadimage = UIButton()
        downloadimage.setImage(UIImage(named: "download.png"), for: .normal)
        downloadimage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(downloadimage)
        
        let shareimage = UIButton()
        shareimage.setImage(UIImage(named: "share.png"), for: .normal)
        shareimage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shareimage)
        
        let image = UIImageView(image: UIImage(named: "final.png"))
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        
        shareimage.addTarget(self, action: #selector(imageReadyButtonTapped), for: .touchUpInside)

        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.heightAnchor.constraint(equalToConstant: 500),
            
            downloadimage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            downloadimage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            downloadimage.widthAnchor.constraint(equalToConstant: 50),
            downloadimage.heightAnchor.constraint(equalToConstant: 50),
            
            shareimage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            shareimage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shareimage.widthAnchor.constraint(equalToConstant: 50),
            shareimage.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func imageReadyButtonTapped() {
        print("dd")
    }

}
