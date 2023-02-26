//
//  PreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Gabriel Rodrigues on 18/02/23.
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    var gif: Gif?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gifImageView.image = gif?.image
    }
    
    @IBAction func shareGif() {
        guard let gif = gif,
            let activityItems = try? [Data(contentsOf: gif.url)] else { return }
    
        let shareVC = createShareActivityViewController(withItems: activityItems)
        
        navigationController?.present(shareVC, animated: true)
    }
    
    private func createShareActivityViewController(withItems items: [Data]) -> UIActivityViewController {
        let shareVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        shareVC.completionWithItemsHandler = { [weak self] _, completed, _, _ in
            if (completed) {
                self?.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        return shareVC
    }
}
