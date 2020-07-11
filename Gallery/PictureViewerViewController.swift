//
//  PictureViewerViewController.swift
//  Gallery
//
//  Created by Tiko on 6/24/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class PictureViewerViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var picturesList: [UIImage] = []
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexPath = self.indexPath {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension PictureViewerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.picturesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PictureViewerCell
        cell?.pictureImageView.image = self.picturesList[indexPath.row]
        return cell!
    }
}

extension PictureViewerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
}
