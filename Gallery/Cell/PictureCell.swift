//
//  PictureCell.swift
//  Gallery
//
//  Created by Tiko on 6/24/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var selectIndicator: UIImageView!
    
//
//    var picture: Picture {
//        didSet {
////            if let imageView = picture.image else {
////                return
////            }
////            self.pictureImageView = imageView.image
//        }
//    }
    
    override var isSelected: Bool {
        didSet {
            self.selectIndicator.isHidden = !self.selectIndicator.isHidden
        }
    }
}
