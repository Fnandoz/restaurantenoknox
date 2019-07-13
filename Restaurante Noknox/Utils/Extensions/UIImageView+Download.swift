//
//  UIImageView+Download.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 13/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

extension UIImageView {
    func download(from url: URL, contentMode mode: UIImageView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}



