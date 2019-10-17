//
//  ImageCell.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/16/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet var imageView: ImageLoader!
    
    override func awakeFromNib() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    func setup(provider: ImageProvider) {
        imageView.loadImage(with: provider.url)
    }
}

class ImageProvider: CollectionViewCellProviderProtocol {
    
    var url: URL
    var uuid: String
    
    init(urlString: String) {
        self.url = URL(string: urlString)!
        self.uuid = UUID().uuidString
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.setup(provider: self)
        return cell
    }
    
    
}

