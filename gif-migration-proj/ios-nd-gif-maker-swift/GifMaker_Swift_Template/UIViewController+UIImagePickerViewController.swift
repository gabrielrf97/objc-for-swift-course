//
//  UIViewController+UIImagePickerViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 18/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//
import MobileCoreServices
import UIKit

extension UIViewController: UIImagePickerControllerDelegate {
    
    func launchCamera() {
        let picker = createPickerViewController(from: .camera)
        self.present(picker, animated: true)
    }
    
    func openGalery() {
        let picker = createPickerViewController(from: .photoLibrary)
        self.present(picker, animated: true)
    }
    
    func createPickerViewController(from sourceType: UIImagePickerControllerSourceType) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        
        picker.sourceType = sourceType
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.allowsEditing = false
        picker.delegate = self
        
        return picker
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String else {
            return
        }
        
        if mediaType == (kUTTypeMovie as String),
        let videoURL = info[UIImagePickerControllerMediaURL] as? NSURL,
        let videoPath = videoURL.absoluteString {
            try? convertVideoToGifAndPresentScreen(videoURL: videoURL as URL)
            dismiss(animated: true)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension UIViewController: UINavigationControllerDelegate {}
