//
//  ViewController.swift
//  Gallery
//
//  Created by Tiko on 6/24/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectButton: UIBarButtonItem!
    
    var galleryViewMode: GalleryViewMode = .standard
    var selectedPicture: [IndexPath : Bool] = [:]
    
    var pictureCollection = [
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)"),
        UIImage(named: "image\((1...5).randomElement() ?? 1)")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDidTap(_ sender: Any) {
        
    }
    
    func changeGalleryViewMode() {
        switch galleryViewMode {
        case .standard:
            self.selectButton.title = "Select"
            self.collectionView.allowsMultipleSelection = false
        case .select:
            self.selectButton.title = "Done"
            self.collectionView.allowsMultipleSelection = true
        }
    }
}

extension PictureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pictureCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PictureCell
        cell?.pictureImageView.image = self.pictureCollection[indexPath.row]
        return cell!
    }
}

extension PictureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch galleryViewMode {
        case .standard:
            if let vc = storyboard.instantiateViewController(identifier: "PictureViewerViewController") as? PictureViewerViewController {
                vc.picture = self.pictureCollection[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case.select:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: <#T##IndexPath#>)
            self.selectedPicture[indexPath] = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.selectedPicture[indexPath] = false
    }
}

extension PictureViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sellSize = collectionView.frame.width * 0.3
        return CGSize(width: sellSize, height: sellSize)
    }
}
