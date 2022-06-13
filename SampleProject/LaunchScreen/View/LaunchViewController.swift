//  LaunchViewController.swift
//  SampleProject
//  Created by Admin on 18/04/22.

import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateToLangScreen()
    }
    
    func navigateToLangScreen() {
        DispatchQueue.main.async {
            let objLanguageVc = Storyboard.loginSignUp.instantiateViewController(withIdentifier: "Authantication") as? LanguageViewController
            let navCon = UINavigationController(rootViewController: objLanguageVc ?? UIViewController())
            if #available(iOS 13.0, *) {
                if let window = UIApplication.shared.currentWindow {
                    window.rootViewController = navCon
                    window.makeKeyAndVisible()
                    } else {
                    if  let window =  UIApplication.shared.windows.first {
                        navCon.isNavigationBarHidden = true
                        window.rootViewController = navCon
                        window.makeKeyAndVisible()
                    } else {
                        self.present(navCon, animated: false, completion: nil)
                    }
                }
            } else {
                navCon.isNavigationBarHidden = true
                Comman.objAppDelegate!.window?.rootViewController = navCon
                Comman.objAppDelegate!.window?.makeKeyAndVisible()
            }
        }
    }
}
