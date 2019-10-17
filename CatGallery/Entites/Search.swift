//
//  Search.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import Foundation

class SearchResponse: Codable {
    let data: [_Data]
    let success: Bool
    let status: Int
    
    init(data: [_Data], success: Bool, status: Int) {
        self.data = data
        self.success = success
        self.status = status
    }
}

// MARK: - Datum
class _Data: Codable {
    let id, title: String
    let imagesCount: Int?
    let images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imagesCount = "images_count"
        case images
    }
    
    init(id: String, title: String, imagesCount: Int?, images: [Image]?) {
        self.id = id
        self.title = title
        self.imagesCount = imagesCount
        self.images = images
    }
}

// MARK: - Image
class Image: Codable {
    let id: String
    let title: String?
    let imageDescription: String?
    let type: TypeEnum
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imageDescription = "description"
        case type
        case link
    }
    
    init(id: String, title: String?, imageDescription: String?, type: TypeEnum, link: String) {
        self.id = id
        self.title = title
        self.imageDescription = imageDescription
        self.type = type
        self.link = link
        
    }
}

enum TypeEnum: String, Codable {
    case imageGIF = "image/gif"
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case videoMp4 = "video/mp4"
}


extension SearchResponse {
    static func decode(data: Data) -> SearchResponse? {
        let me = try? newJSONDecoder().decode(self, from: data)
        return me
    }
}
