//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Thoai Le on 6/13/19.
//  Copyright © 2019 Thoai Le. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        collectionView.reloadData()
        

    }


    // MARK: - Navigation Segue


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPhoto" {
            guard let addDetailVC = segue.destination as? PhotoDetialViewController
                else { return }
            
            addDetailVC.photoController = photoController
            addDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "PhotoDetail" {
            guard let photoDetailVC = segue.destination as?
            PhotoDetialViewController,
            let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photo = photo
            
        } else if segue.identifier == "ThemeSelect" {
            guard let themeSelectionVC = segue.destination
                as? ThemeSelectionViewController else { return }
            
            themeSelectionVC.themeHelper = themeHelper
        }
     
    }
 

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if themePreference == "Blue" {
            collectionView.backgroundColor = .blue
        }
    }

 
}
