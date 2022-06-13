//
//  CustomeTabBar.swift
//  SampleProject
//
//  Created by apple on 15/04/22.
//

import UIKit

class CustomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       doInitialize()
    }
    // MARK: - User Functions
    func doInitialize() {
        
        self.navigationController?.navigationBar.isHidden = true
        // tabbar setup
        self.tabBar.items?[0].title = ""
        self.tabBar.items?[0].selectedImage = UIImage(named: "homeActive")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[0].image = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)

        self.tabBar.items?[1].title = ""
        self.tabBar.items?[1].selectedImage = UIImage(named: "layersActive")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[1].image = UIImage(named: "layers")?.withRenderingMode(.alwaysOriginal)

        self.tabBar.items?[2].title = ""
        self.tabBar.items?[2].selectedImage = UIImage(named: "shoppingCartActive")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[2].image = UIImage(named: "shopping-cart")?.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items?[3].title = ""
        self.tabBar.items?[3].selectedImage = UIImage(named: "userActive")?.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[3].image = UIImage(named: "user")?.withRenderingMode(.alwaysOriginal)
        
//        "F2F6F8".colorWithHexString(hex: "F2F6F8")
//         self.tabBar.tintColor = "062D7A".colorWithHexString(hex: "062D7A")
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().clipsToBounds = true
         UITabBar.appearance().backgroundColor = UIColor.white
    }
        
    // MARK: - TabBarController Delegates
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if self.selectedIndex != 0 {
            UIGraphicsBeginImageContextWithOptions(self.view.frame.size, true, 0)
            let context = UIGraphicsGetCurrentContext()!
            view.layer.render(in: context)
            UIGraphicsEndImageContext()
        }
        return true
    }

}
