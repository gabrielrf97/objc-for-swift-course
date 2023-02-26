//
//  UIViewController+GifConvertion.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 23/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
 
let frameCount = 16
let delayTime : Float = 0.2
let loopCount = 0

extension UIViewController {
    
    enum GifCreationError: Error {
        case conversion
    }
    
    func cropVideoToSquare(rawVideoURL: URL, trimStart: Float?, trimEnd: Float?) {
        //Create the AVAsset and AVAssetTrack
        let videoAsset = AVAsset(url: rawVideoURL)
        guard let videoTrack = videoAsset.tracks(withMediaType: .video).first else { return }
        
        // Crop to square
        let videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = CGSizeMake(videoTrack.naturalSize.height, videoTrack.naturalSize.height)
        videoComposition.frameDuration = CMTimeMake(1, 30)
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = CMTimeRangeMake(kCMTimeZero, CMTimeMakeWithSeconds(60, 30))
        
        // rotate to portrait
        let transformer = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
        let t1 = CGAffineTransformMakeTranslation(videoTrack.naturalSize.height, -(videoTrack.naturalSize.width - videoTrack.naturalSize.height) / 2 );
        let t2 = CGAffineTransformRotate(t1, .pi/2);
        
        let finalTransform = t2;
        transformer.setTransform(finalTransform, at: kCMTimeZero)
        instruction.layerInstructions = [transformer]
        videoComposition.instructions = [instruction]
        
        // export
        guard let exporter = AVAssetExportSession(asset: videoAsset, presetName: AVAssetExportPresetHighestQuality) else { return }
        exporter.videoComposition = videoComposition;
        guard let path = createPath() else { return }
        exporter.outputURL = URL(string: path)
        exporter.outputFileType = AVFileType.mov
        
        exporter.exportAsynchronously(completionHandler: { [weak self] in
            guard let croppedURL = exporter.outputURL else { return }
            try? self?.convertVideoToGifAndPresentScreen(videoURL: croppedURL, trimmedStart: trimStart, trimmedEnd: trimEnd)
        })
    }
    
    private func createPath() -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths.first
        let manager = FileManager.default
        guard var outputURL = documentsDirectory?.appending("output") else { return nil }
        try? manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true)
        outputURL.append("output.mov");
        try? manager.removeItem(atPath: outputURL)
        return outputURL;
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
