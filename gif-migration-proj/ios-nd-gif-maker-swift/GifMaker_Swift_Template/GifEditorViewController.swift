//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 18/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class GifEditorViewController: UIViewController {
        
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var gifImageView: UIImageView!
    
    var gif: Gif?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGifImage()
        subscribeToKeyboardNotifications()
    }
    
    private func setGifImage() {
        if let gif = gif {
            gifImageView.image = gif.image
        }
    }
}

//MARK: UITextFieldDelegate methods
extension GifEditorViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: KeyboardObservation methods
extension GifEditorViewController {
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if (view.frame.origin.y >= 0) {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if (view.frame.origin.y < 0) {
            view.frame.origin.y += getKeyboardHeight(notification)
        }
    }
    
    private func getKeyboardHeight(_ notification: Notification) -> Double {
        guard let userInfo = notification.userInfo,
              let keyboardFrameEnd = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return 0.0 }
        return keyboardFrameEnd.size.height;
    }
}
