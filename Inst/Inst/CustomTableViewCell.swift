//
//  CustomTableViewCell.swift
//  Inst
//
//  Created by Гузель on 29.09.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avaratImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var markedButton: UIButton!
    var mainViewController: ViewController!
    var selectedIndex:Int!
    var currentSelectedArray: CurrentSelectedArray!
    
    func addingPhoto(photo: Photo) {
        descriptionLabel.text = photo.description
        contentImageView.image = photo.photo
        avaratImageView.layer.cornerRadius = avaratImageView.frame.size.width / 2
        avaratImageView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

