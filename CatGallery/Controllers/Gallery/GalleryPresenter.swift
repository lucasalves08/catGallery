//
//  GalleryPresenter.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import Foundation


class GalleryPresenter: GalleryPresenterProtocol {
    var view: GalleryViewProtocol!
    var imageLinks: [String] = []
    var interactor: GalleryInteractorProtocol!
    var dataSource: [CollectionViewCellProviderProtocol]! = []
    
    func viewDidLoad() {
        view.showLoading()
        interactor.fetchImages()
    }
    
}

extension GalleryPresenter: GalleryInteractorOutputProtocol {
    func onSuccess(with response: SearchResponse) {
        view.hideLoading()
        for data in response.data {
            for image in data.images ?? [] {
                if image.type != TypeEnum.videoMp4 && image.type != TypeEnum.imageGIF {
                    dataSource.append(ImageProvider(urlString: image.link))
                }
            }
        }
        view.reload()
    }
    
    func onError(message: String) {
        view.hideLoading()
        view.alert(message: message)
    }
}
