//
//  photoCell.swift
//  me
//
//  Created by Ganiya Nursalieva on 14.02.2025.
//

import UIKit

class photoCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    
    func configure(_ image: UIImage) {
        coverImage.image = image
    }
}
