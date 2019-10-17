//
//  ReusableCellProtocol.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import UIKit

protocol CollectionViewCellProviderProtocol: class {
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

