//
//  Helper.swift
//  TheLastLogbook
//
//  Created by Nick George on 5/15/18.
//  Copyright © 2018 Nick George. All rights reserved.
//

import Foundation
import UIKit
import Network

class Helper {
    static let instance = Helper()
    
    //MARK: Display Alert
    func displayAlert(alertTitle: String, message: String, actionTitle: String, style: UIAlertAction.Style, handler: @escaping ((UIAlertAction)->Void)) {
        let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: style, handler: handler)
        alertController.addAction(action)
        //UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
}

extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}

