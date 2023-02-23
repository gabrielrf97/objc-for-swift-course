//
//  UIViewController+GifConvertion.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 23/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import Foundation
 
fileprivate let frameCount = 16
fileprivate let delayTime : Float = 0.2
fileprivate let loopCount = 0


extension UIViewController {
    
    enum GifCreationError: Error {
        case conversion
    }
    
    func convertVideoToGifAndPresentScreen(videoURL: URL) throws {
        let regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        guard let gifURL = regift.createGif() else {
            throw GifCreationError.conversion
        }
        displayGif(url: gifURL)
    }
    
    func displayGif(url: URL) {
        guard let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as? GifEditorViewController else {
            return
        }
        gifEditorVC.gifURL = url
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}
