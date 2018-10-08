//
//  Photo.swift
//  Inst
//
//  Created by Гузель on 29.09.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    
    var photo: UIImage
    var description: String
    
    init(photo: UIImage, description: String) {
        self.photo = photo
        self.description = description
    }
}
