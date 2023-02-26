//
//  WelcomeViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 18/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let pocGif = UIImage.gif(name: "hotlineBling")
        gifImageView.image = pocGif
    }
    
    @IBAction func launchVideoCamera(sender: AnyObject) {
        presentVideoSourceOptions()
    }
    
    private func presentVideoSourceOptions() {
        
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
            openGallery()
        } else {
            let sourcePickActionSheet = UIAlertController(title: "Create new GIF", message: nil, preferredStyle: .actionSheet)
            sourcePickActionSheet.view.tintColor = UIColor(red: 255.0/255.0, green: 65.0/255.0, blue: 112.0/255.0, alpha: 1.0)
    
            let recordVideo = UIAlertAction(title: "Record a Video", style: .default, handler: { _ in
                self.launchCamera()
            })
        
            let chooseFromGallery = UIAlertAction(title: "Choose from Existing", style: .default, handler: {_ in
                self.openGallery()
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        
            sourcePickActionSheet.addAction(recordVideo)
            sourcePickActionSheet.addAction(chooseFromGallery)
            sourcePickActionSheet.addAction(cancel)
            
            present(sourcePickActionSheet, animated: true)
        }
    }
}
