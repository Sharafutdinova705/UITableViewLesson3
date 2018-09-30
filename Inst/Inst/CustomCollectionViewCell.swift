//
//  CustomCollectionViewCell.swift
//  Inst
//
//  Created by Гузель on 29.09.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    
    
    func addPhoto(photo: Photo) {
        myImageView.image = photo.photo
    }
    
}
