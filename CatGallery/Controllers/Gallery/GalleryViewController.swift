//
//  GalleryViewController.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    var presenter: GalleryPresenterProtocol!
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFrame()
    }
    
    func setupFrame() {
        let presenter = GalleryPresenter()
        let interactor = GalleryInteractor()
        self.presenter = presenter
        presenter.view = self
        presenter.interactor = interactor
        interactor.output = presenter
        presenter.viewDidLoad()
    }
}

extension GalleryViewController: GalleryViewProtocol {
    func reload(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.indicatorView.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
        
    }
    
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = presenter.dataSource[indexPath.row].collectionView(collectionView: collectionView, cellForItemAt: indexPath)
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

