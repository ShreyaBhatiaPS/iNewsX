//
//  UIImageView+extension.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation
import UIKit

let cacheImage = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloadImage(from urlString: String) {
        contentMode = .scaleAspectFit
        guard let imageUrl = URL(string: urlString) else {
            return
        }
        self.image = nil
        
        // Check cached image
        if let imageFromCache = cacheImage.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) {
            data, response, error in
            
            if error != nil {
                print(ErrorString.imageURLError.rawValue, error?.localizedDescription ?? "")
                return
            }
            
            if let data = data {
                DispatchQueue.main.async { [weak self] in
                    if let imageFromURL = UIImage(data: data) {
                        cacheImage.setObject(imageFromURL, forKey: urlString as NSString)
                        self?.image = imageFromURL
                    } else {
                        self?.image = UIImage()
                    }
                }
            }
        }.resume()
    }
    
    
}
