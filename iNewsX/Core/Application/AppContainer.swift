//
//  AppContainer.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 06/07/22.
//

import Foundation
import UIKit

class AppContainer {
    
    func initializeApplication(on window: UIWindow?) {
        let newsModule = NewsModule()
        let viewController = newsModule.callToNewsViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
