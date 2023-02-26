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
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    func openGallery() {
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
        let videoURL = info[UIImagePickerControllerMediaURL] as? NSURL {
            let videoPath = videoURL.absoluteString
            let startedTrim = info["UIImagePickerControllerVideoEditingStart"] as? Float
            let finishedTrim = info["UIImagePickerControllerVideoEditingEnd"] as? Float
            try? convertVideoToGifAndPresentScreen(videoURL: videoURL as URL, trimmedStart: startedTrim, trimmedEnd: finishedTrim)
            dismiss(animated: true)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension UIViewController: UINavigationControllerDelegate {}
