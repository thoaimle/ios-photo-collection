//
//  PhotoDetialViewController.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 6/13/19.
//  Copyright © 2019 Thoai Le. All rights reserved.
//

import UIKit

class PhotoDetialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

   
    }
    
    // MARK: - AddPhotos
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:  true, completion: nil)
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = pickedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - SavePhotos
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = photoTextField.text, !title.isEmpty,
        let image = photoImageView.image,
        let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
        

    }
    
    // MARK: - Theme

private func setTheme() {
    guard let themePreference = themeHelper?.themePreference else { return }
    
    if themePreference == "Dark" {
        view.backgroundColor = .darkGray
    } else if themePreference == "Blue" {
        view.backgroundColor = .blue
    }
    }
    
   private func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        photoTextField.text = photo.title
    }
}
