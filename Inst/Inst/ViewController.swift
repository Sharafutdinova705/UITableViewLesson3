//
//  ViewController.swift
//  Inst
//
//  Created by Гузель on 26.09.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet var myView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        if mySegmentedControl.selectedSegmentIndex == 0 || mySegmentedControl.selectedSegmentIndex == 2 {
            myCollectionView.reloadData()
        }
    }
    
    var photoArray:[Photo] = []
    var markedArray:[Photo] = []
    
    func creatProfile() -> [Photo] {
        
        var fillingPhotoArray:[Photo] = []
        
        let photo1 = Photo(photo: #imageLiteral(resourceName: "a1"), description: "My city.")
        let photo2 = Photo(photo: #imageLiteral(resourceName: "a2"), description: "Sea")
        let photo3 = Photo(photo: #imageLiteral(resourceName: "a3"), description: "It's me.")
        let photo4 = Photo(photo: #imageLiteral(resourceName: "a4"), description: "Seashells.")
        let photo5 = Photo(photo: #imageLiteral(resourceName: "a5"), description: "Mamayev Kurgan.")
        let photo6 = Photo(photo: #imageLiteral(resourceName: "a6"), description: "Also in Mamayev Kurgan.")
        let photo7 = Photo(photo: #imageLiteral(resourceName: "a9"), description: "Where we lived.")
        let photo8 = Photo(photo: #imageLiteral(resourceName: "a8"), description: "Seeeeaaaa.")
        fillingPhotoArray.append(photo1)
        fillingPhotoArray.append(photo2)
        fillingPhotoArray.append(photo3)
        fillingPhotoArray.append(photo4)
        fillingPhotoArray.append(photo5)
        fillingPhotoArray.append(photo6)
        fillingPhotoArray.append(photo7)
        fillingPhotoArray.append(photo8)
        
        return fillingPhotoArray
    }
    
    func creatMarkedArray() -> [Photo] {
        
        var markphotoArray:[Photo] = []
        let photo3 = Photo(photo: #imageLiteral(resourceName: "a3"), description: "It's me.")
       
        markphotoArray.append(photo3)
        
        
        return markphotoArray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.contentSize.height = 1300
        tableView.delegate = self
        tableView.dataSource = self
        photoArray = creatProfile()
        markedArray = creatMarkedArray()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myCollectionView.reloadData()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photos = photoArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablePhoto") as! CustomTableViewCell
        cell.addingPhoto(photo: photos)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int = 5
            if mySegmentedControl.selectedSegmentIndex == 0 {
                print("yes")
                count = photoArray.count
            } else if mySegmentedControl.selectedSegmentIndex == 2 {
                count = markedArray.count
            }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var photosCollection:Photo
        let cell1 = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Collection", for: indexPath) as! CustomCollectionViewCell
        if mySegmentedControl.selectedSegmentIndex == 0 {
            photosCollection = photoArray[indexPath.row]
            cell1.addPhoto(photo: photosCollection)
        } else if mySegmentedControl.selectedSegmentIndex == 2 {
            photosCollection = markedArray[indexPath.row]
            cell1.addPhoto(photo: photosCollection)
        }
        return cell1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let photoDetailVC = mainStoryboard.instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        photoDetailVC.mainViewController = self
        photoDetailVC.selectedIndex = indexPath.row
        if mySegmentedControl.selectedSegmentIndex == 0 {
            photoDetailVC.currentSelectedArray = .photos
        } else if mySegmentedControl.selectedSegmentIndex == 2 {
            photoDetailVC.currentSelectedArray = .markedPhotos
        }
        self.show(photoDetailVC, sender: nil)
    }
    
    
    
    @IBAction func selectedSegment(_ sender: Any) {
        let currentIndex = mySegmentedControl.selectedSegmentIndex
        switch (currentIndex) {
        case 0:
            tableView.isHidden = true
            myCollectionView.isHidden = false
        case 1:
            myCollectionView.isHidden = true
            tableView.isHidden = false
        case 2:
            tableView.isHidden = true
            myCollectionView.isHidden = false
        default:
            tableView.isHidden = true
            myCollectionView.isHidden = false
        }
    }
    
}

