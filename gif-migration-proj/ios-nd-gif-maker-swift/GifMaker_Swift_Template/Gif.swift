//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 23/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    let url: URL
    let caption: String?
    let videoURL: URL?
    let image: UIImage?
    var data: Data?
    
    init(url: URL, videoURL: URL, caption: String?) {
        self.url = url
        self.caption = caption
        self.videoURL = videoURL
        image = UIImage.gif(url: url.absoluteString)
        data = nil
    }
}
