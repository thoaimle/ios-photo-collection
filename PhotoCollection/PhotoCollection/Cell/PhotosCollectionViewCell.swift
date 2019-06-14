//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 6/13/19.
//  Copyright © 2019 Thoai Le. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
   private func updateViews() {
        guard let photoData = photo?.imageData else { return }
        imageView.image = UIImage(data: photoData)
        nameLabel.text = photo?.title
    }
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
}
