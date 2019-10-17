//
//  GalleryProtocols.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import UIKit

protocol GalleryViewProtocol: UIViewController {
    var presenter: GalleryPresenterProtocol! { get set }
    func reload()
    func showLoading()
    func hideLoading()
    
}

protocol GalleryPresenterProtocol {
    var view: GalleryViewProtocol! { get set }
    var dataSource: [CollectionViewCellProviderProtocol]! { get set }
    func viewDidLoad()
}

protocol GalleryInteractorProtocol {
    var output: GalleryInteractorOutputProtocol! { get set}
    func fetchImages()
}

protocol GalleryInteractorOutputProtocol {
    var interactor: GalleryInteractorProtocol! { get set }
    func onSuccess(with response: SearchResponse)
    func onError(message: String)
}
