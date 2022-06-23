//
//  BaseRouting.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation
import UIKit

protocol BaseRouting {
    
    var topViewController: UIViewController? { get }
    var anyTopController: UIViewController? { get }
    var topSplitController: UISplitViewController? { get }
    var topNavigationController: UINavigationController? { get }
    var topTabBarController: UITabBarController? { get }
}

extension BaseRouting {
    
    private var rootController: UIViewController? {
        let app = UIApplication.shared
        let topWindow = app.windows.first { $0.isKeyWindow }
        let rootVC = topWindow?.rootViewController
        
        return rootVC
    }
    
    var topViewController: UIViewController? {
        let split = topSplitController
        let navigation = topNavigationController
        let tabBar = topTabBarController
        
        if split != nil || navigation != nil || tabBar != nil {
            return nil
        }
        
        return rootController
    }
    
    var anyTopController: UIViewController? {
        rootController
    }
    
    var topSplitController: UISplitViewController? {
        rootController as? UISplitViewController
    }
    
    var topNavigationController: UINavigationController? {
        rootController as? UINavigationController
    }
    
    var topTabBarController: UITabBarController? {
        rootController as? UITabBarController
    }
}
