//
//  UIViewController+Alert.swift
//  CatGallery
//
//  Created by Lucas Alves on 10/17/19.
//  Copyright © 2019 Lucas Alves. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title: String? = "Atenção", message: String, handler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
            if let handler = handler {
                handler()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
