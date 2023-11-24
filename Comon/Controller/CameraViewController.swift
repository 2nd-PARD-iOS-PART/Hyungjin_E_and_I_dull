//
//  ViewController.swift
//  test_camera
//
//  Created by hyungjin kim on 2023/11/25.
//

import UIKit
import AVFoundation


let num = 6;

class CameraViewController: UIViewController {
  private let cameraButton: UIButton = {
    let button = UIButton()
    button.setTitle("camera", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  private let imageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var isCameraAuthorized: Bool {
    AVCaptureDevice.authorizationStatus(for: .video) == .authorized
  }
    
//    private let uploadButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Upload", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.setTitleColor(.blue, for: .highlighted)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.isHidden = true // Hide the button initially
//        return button
//    }()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.imageView)
    self.view.addSubview(self.cameraButton)
//    uploadButton.addTarget(self, action: #selector(uploadImageTapped), for: .touchUpInside)
//    self.view.addSubview(uploadButton)
//
//     NSLayoutConstraint.activate([
//         uploadButton.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: 20),
//         uploadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//     ])
    NSLayoutConstraint.activate([
      self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
      self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.imageView.heightAnchor.constraint(equalToConstant: 300),
      self.imageView.widthAnchor.constraint(equalToConstant: 300),
    ])
    NSLayoutConstraint.activate([
      self.cameraButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.cameraButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
    
  @objc private func openCamera() {
    #if targetEnvironment(simulator)
    fatalError()
    #endif
    
    // Privacy - Camera Usage Description
    AVCaptureDevice.requestAccess(for: .video) { [weak self] isAuthorized in
      guard isAuthorized else {
        self?.showAlertGoToSetting()
        return
      }
      
      DispatchQueue.main.async {
        let pickerController = UIImagePickerController() // must be used from main thread only
        pickerController.sourceType = .camera
        pickerController.allowsEditing = false
        pickerController.mediaTypes = ["public.image"]
        // 만약 비디오가 필요한 경우,
  //      imagePicker.mediaTypes = ["public.movie"]
  //      imagePicker.videoQuality = .typeHigh
        pickerController.delegate = self
        self?.present(pickerController, animated: true)
      }
    }
  }
  
  func showAlertGoToSetting() {
    let alertController = UIAlertController(
      title: "현재 카메라 사용에 대한 접근 권한이 없습니다.",
      message: "설정 > {앱 이름}탭에서 접근을 활성화 할 수 있습니다.",
      preferredStyle: .alert
    )
    let cancelAlert = UIAlertAction(
      title: "취소",
      style: .cancel
    ) { _ in
        alertController.dismiss(animated: true, completion: nil)
      }
    let goToSettingAlert = UIAlertAction(
      title: "설정으로 이동하기",
      style: .default) { _ in
        guard
          let settingURL = URL(string: UIApplication.openSettingsURLString),
          UIApplication.shared.canOpenURL(settingURL)
        else { return }
        UIApplication.shared.open(settingURL, options: [:])
      }
    [cancelAlert, goToSettingAlert]
      .forEach(alertController.addAction(_:))
    DispatchQueue.main.async {
      self.present(alertController, animated: true) // must be used from main thread only
    }
  }
    
    func fetchImageCount() {
        let urlString = "http://172.18.129.221:8080/api/numOfImages"
        guard let url = URL(string: urlString) else {
            print("Invalid URL for fetching image count")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Handle the response here
            if let error = error {
                print("Error fetching image count: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Error with the response from server when fetching image count")
                return
            }

            guard let data = data,
                  let imageCount = try? JSONDecoder().decode(Int.self, from: data) else {
                print("Could not decode image count from response")
                return
            }

            DispatchQueue.main.async {
                print("Number of images in the folder: \(imageCount)")
                if imageCount == num {
                    // Navigate to ResultViewController
                    self?.navigateToResultViewController()
                } else {
                    // Show alert that people are still taking the picture
                    self?.showTakingPictureAlert()
                }
            }
        }

        task.resume()
    }
    
    private func navigateToResultViewController() {
        print("Attempting to navigate to ResultViewController") // Diagnostic print statement
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            if let navigationController = self.navigationController {
                print("Navigating using navigation controller") // Diagnostic print statement
                navigationController.pushViewController(ResultViewController(), animated: true)
            } else {
                print("Presenting modally") // Diagnostic print statement
                let resultVC = ResultViewController()
                self.present(resultVC, animated: true, completion: {
                    print("ResultViewController presented") // Diagnostic print statement
                })
            }
        }
    }


    private func showTakingPictureAlert() {
        let alertController = UIAlertController(
            title: "Wait a Moment",
            message: "People are still taking pictures.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func uploadImage(image: UIImage, toUrl urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Could not get JPEG representation of UIImage")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n")
        body.append("Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append("\r\n")
        body.append("--\(boundary)--\r\n")


        let task = URLSession.shared.uploadTask(with: request, from: body) { [weak self] data, response, error in
                print("Upload task completed") // Diagnostic print statement
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    print("Response status code: \(response.statusCode)") // Diagnostic print statement
                    if (200...299).contains(response.statusCode) {
                        print("Successful upload, fetching image count...") // Diagnostic print statement
                        self?.fetchImageCount()
                    } else {
                        print("Server error: \(response.statusCode)")
                    }
                }
            }
            task.resume()
        }

    
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

extension CameraViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
  ) {
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      picker.dismiss(animated: true)
      return
    }
    self.imageView.image = image
      
      let uploadUrlString = "http://172.18.129.221:8080/api/upload"
      uploadImage(image: image, toUrl: uploadUrlString)
//    self.uploadButton.isHidden = false
    picker.dismiss(animated: true, completion: nil)
  }
}

