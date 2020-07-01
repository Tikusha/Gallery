//
//  ViewController.swift
//  Gallery
//
//  Created by Tiko on 6/24/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var selectButton: UIBarButtonItem!
    @IBOutlet private weak var deleteButton: UIButton!
    
    var galleryViewMode: GalleryViewMode = .standard
    var selectedPicture: [IndexPath : Bool] = [:]
    var picturesIndexPath: [IndexPath] = []
    
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
        self.setInitilizer()
    }
    
    private func setInitilizer() {
        self.deleteButton.isHidden = true
    }
    
    private func changeGalleryViewMode() {
        switch galleryViewMode {
        case .standard:
            self.selectButton.title = "Select"
            self.collectionView.allowsMultipleSelection = false
        case .select:
            self.selectButton.title = "Done"
            self.collectionView.allowsMultipleSelection = true
        }
    }
    
    @IBAction func selectDidTap(_ sender: Any) {
        self.galleryViewMode = self.galleryViewMode == .standard ? .select : .standard
        self.changeGalleryViewMode()
        self.deleteButton.isHidden = !self.deleteButton.isHidden
        
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        for (key, value) in self.selectedPicture {
            if value {
                self.picturesIndexPath.append(key)
            }
        }
        for i in self.picturesIndexPath.sorted(by: { $0.item > $1.item }) {
            self.pictureCollection.remove(at: i.item)
        }
        collectionView.deleteItems(at: self.picturesIndexPath)
        self.picturesIndexPath.removeAll()
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
            collectionView.deselectItem(at: indexPath, animated: true)
            
            var list: [UIImage] = []
            for i in self.pictureCollection {
                if let item = i {
                    list.append(item)
                }
            }
            
            if let vc = storyboard.instantiateViewController(identifier: "PictureViewerViewController") as? PictureViewerViewController {
                vc.picturesList.append(contentsOf: list)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case.select:
            self.selectedPicture[indexPath] = true
        }
        print(self.selectedPicture)
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
