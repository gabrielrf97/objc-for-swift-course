//
//  UIViewController+GifConvertion.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 23/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import Foundation
 
let frameCount = 16
let delayTime : Float = 0.2
let loopCount = 0

extension UIViewController {
    
    enum GifCreationError: Error {
        case conversion
    }
    
    func convertVideoToGifAndPresentScreen(videoURL: URL, trimmedStart: Float?, trimmedEnd: Float?) throws {
        var regift: Regift
        
        if let trimmedStart = trimmedStart,
           let trimmedEnd = trimmedEnd {
            let duration = trimmedEnd - trimmedStart
            regift = Regift(sourceFileURL: videoURL, startTime: trimmedStart, duration: duration, frameRate: frameCount)
        } else {
            regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        }
    
        guard let gifURL = regift.createGif()
             else {
            throw GifCreationError.conversion
        }
        let gif = Gif(url: gifURL, videoURL: videoURL, caption: nil)
        display(gif: gif)
    }
    
    func display(gif: Gif) {
        guard let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as? GifEditorViewController else {
            return
        }
        gifEditorVC.gif = gif
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}
