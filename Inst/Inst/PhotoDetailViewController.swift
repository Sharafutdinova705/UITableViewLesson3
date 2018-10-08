//
//  PhotoDetailViewController.swift
//  Inst
//
//  Created by Гузель on 29.09.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

enum CurrentSelectedArray {
    case photos
    case markedPhotos
}

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var currentPhotoImageView: UIImageView!
    @IBOutlet weak var currentDescriptionLabel: UILabel!
    
    var mainViewController: ViewController!
    var selectedIndex:Int!
    var currentSelectedArray: CurrentSelectedArray!
    
    @IBAction func toMarkedArray(_ sender: Any) {
        
        let alert = UIAlertController(title: "Перенос", message: "Вы хотите перенести фотографию в отмеченные?", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Да", style: .default, handler: {(alert: UIAlertAction!) in self.actionToMark()})
        let action2 = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)
        mainViewController.present(alert, animated: true, completion: nil)
    }
    
    func actionToMark(){
        
        if currentSelectedArray == .photos{
            
            mainViewController.markedArray.append(mainViewController.photoArray[selectedIndex])
            mainViewController.photoArray.remove(at: selectedIndex)
            selectedIndex = mainViewController.markedArray.count - 1
            currentSelectedArray = .markedPhotos
            
        } else if currentSelectedArray == .markedPhotos{
            
            mainViewController.photoArray.append(mainViewController.markedArray[selectedIndex])
            mainViewController.markedArray.remove(at: selectedIndex)
            selectedIndex = mainViewController.photoArray.count - 1
            currentSelectedArray = .photos
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
        if currentSelectedArray == .photos {
        
            currentPhotoImageView.image = mainViewController.photoArray[selectedIndex].photo
        } else if currentSelectedArray == .markedPhotos {
            
            currentPhotoImageView.image = mainViewController.markedArray[selectedIndex].photo
        }
        if currentSelectedArray == .photos {
            
            currentDescriptionLabel.text = mainViewController.photoArray[selectedIndex].description
        } else if currentSelectedArray == .markedPhotos {
            
            currentDescriptionLabel.text = mainViewController.markedArray[selectedIndex].description
        }
    }
}
