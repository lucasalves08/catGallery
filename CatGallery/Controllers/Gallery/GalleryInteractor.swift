//
//  GalleryInteractor.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import Foundation

class GalleryInteractor: GalleryInteractorProtocol {
    var output: GalleryInteractorOutputProtocol!
    
    func fetchImages() {
        WebService.get(url: "https://api.imgur.com/3/gallery/search/?q=cats", onSuccess: { responseData in
            if let response = SearchResponse.decode(data: responseData) {
                self.output.onSuccess(with: response)
            } else {
                self.output.onError(message: "Aconteceu um erro inesperado!")
            }
            
        }, onError: {
            self.output.onError(message: $0)
        })
    }
}
