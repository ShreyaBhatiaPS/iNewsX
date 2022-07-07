//
//  UIViewController+extension.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    
      func presentAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
      }
    
}
