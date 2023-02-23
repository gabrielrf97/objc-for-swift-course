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
        
    @IBOutlet weak var gifImageView: UIImageView!
    var gifURL: URL?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let gifURL = gifURL {
            let gifImage = UIImage.gif(url: gifURL.absoluteString)
            gifImageView.image = gifImage
        }
    }
}
