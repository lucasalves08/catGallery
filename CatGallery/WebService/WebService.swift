//
//  WebService.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/15/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import Foundation

class WebService: NSObject {
    
    static func get(url: String, onSuccess: @escaping (Data) -> Void, onError: @escaping (String) -> Void) {
        
        let url = NSURL(string: url)
        let request = NSMutableURLRequest(url: url! as URL)
        request.setValue("Client-ID 1ceddedc03a5d71", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            if let err = error {
                onError(err.localizedDescription)
            }
            
            guard let responseData = data else {
                return
            }
            onSuccess(responseData)

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    return
            }
        }
        task.resume()
        
    }
    
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

