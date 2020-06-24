//
//  PictureViewerViewController.swift
//  Gallery
//
//  Created by Tiko on 6/24/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class PictureViewerViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var picture: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setImage()
    }
    
    func setImage() {
        self.pictureImageView.image = self.picture
    }
}
