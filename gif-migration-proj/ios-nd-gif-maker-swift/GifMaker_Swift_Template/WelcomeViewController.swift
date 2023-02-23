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
        launchCamera()
    }
}
