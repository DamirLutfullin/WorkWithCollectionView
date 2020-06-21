//
//  PhotoCollectionViewController.swift
//  WorkWithCollectionView
//
//  Created by Damir Lutfullin on 20.06.2020.
//  Copyright © 2020 DamirLutfullin. All rights reserved.
//

import UIKit

class PhotoCollectionVC: UICollectionViewController {
    
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    
    let countItemsInRow: CGFloat = 2
    let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Photo tapper"
        collectionView.backgroundColor = .white
        
        collectionView.register(PhotoCVCell.self, forCellWithReuseIdentifier: PhotoCVCell.reuseIdentifier )
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCVCell.reuseIdentifier, for: indexPath) as! PhotoCVCell
        let imageName = photos[indexPath.item]
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.modalPresentationStyle = .automatic
        let imageName = photos[indexPath.item]
        detailVC.imageView.image = UIImage(named: imageName)
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension PhotoCollectionVC: UICollectionViewDelegateFlowLayout {
    
    // определяем размер ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpacind = (countItemsInRow + 1) * insets.top
        let widthOfItem = (UIScreen.main.bounds.width - paddingSpacind) / countItemsInRow
        return CGSize(width: widthOfItem, height: widthOfItem)
    }
    
    
    // расстояние между коллекцией и хедером, футером и боковыми стенкам экрана
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        insets
    }
    
    // расстояние между линиями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    // расстояние между итемами в одной линии
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }

}
