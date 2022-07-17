//
//  UIActivityIndicatorView+extension.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 17/07/22.
//

import UIKit

extension UIActivityIndicatorView {
    
    func start(center: CGPoint) {
        self.style = .medium
        self.center = center
        self.startAnimating()
    }
    
    func stop() {
        self.stopAnimating()
        self.removeFromSuperview()
    }
    
}
