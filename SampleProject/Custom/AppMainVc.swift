//
//  AppMainVc.swift
//  SampleProject

import Foundation
import UIKit
import Lottie
import Photos

// swiftlint:disable function_parameter_count multiple_closures_with_trailing_closure empty_parentheses_with_trailing_closure
@available(iOS 10.0, *)
class AppMainVc: UIViewController {
    
    // MARK: - Properties
    var activityView: UIView?
    var networkView: UIView!
    var viewLoader: AnimationView!
    var internetVc: InternetStatusVc!
    var loaderBackView: UIView!
    var newView        = UIView()
    let lblTitleLabel   = UILabel()
    let lblSubTitleLabel = UILabel()
    
    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        newView = UIView(frame: CGRect(x: 0, y: -88, width: UIScreen.main.bounds.width, height: 88.0))
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else { /* Fallback on earlier versions */ }
    }
    
    /* Getting color color by frames */
    func color(forFrame currentFrame: CGFloat, startKeyframe: CGFloat, endKeyframe: CGFloat, interpolatedProgress: CGFloat, start startColor: CGColor!, end endColor: CGColor!, currentColor interpolatedColor: CGColor!) -> Unmanaged<CGColor>! {
        return  Unmanaged.passRetained(UIColor.blue.cgColor)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
            return .default
        }
    }
    
    /* Setup Loader Animation */
    func setupAnimationView() {
        viewLoader = AnimationView.init(name: "loader")
        viewLoader.contentMode = .scaleAspectFit
        viewLoader.frame = CGRect.init(x: 0, y: 0, width: 90, height: 90)
        viewLoader.center = self.view.center
        viewLoader.loopMode = .loop
        _ = AnimationKeypath(keypath: "**.Color")
    }
    
    /* Start Loader */
    func startSpinner() {
        setupAnimationView()
        self.viewLoader.isHidden = false
        self.loaderBackView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.loaderBackView.backgroundColor = UIColor.clear
        self.view.addSubview(self.loaderBackView)
        self.view.addSubview(self.viewLoader)
        self.viewLoader.play()
    }
    
    /* Stop Loader */
    func stopSpinner() {
        if self.viewLoader != nil {
            self.viewLoader.isHidden = true
            self.viewLoader.stop()
            self.loaderBackView.removeFromSuperview()
            self.viewLoader.removeFromSuperview()
        }
    }
    
    /* Checking List of subView */
    func listSubviewsOf(_ view: UIView?) {
        // Get the subviews of the view
        let subviews = view?.subviews
        // Return if there are no subviews
        if subviews?.isEmpty == true {
            return // COUNT CHECK LINE
        }
        for subview in subviews ?? [] {
            // Do what you want to do with the subview
            print("\(subview)")
        }
    }
    
    /* Creating Top Banner with Animation */
    func showBanner(tilte: String, subTitle: String, textColor: String = ColorCode.blue) {
        UIView.animate(withDuration: 0.8,
                       delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveLinear, .allowUserInteraction],
                       animations: {
            let viewWidth = UIScreen.main.bounds.width * 0.9
            var YAnchor = 25
            if UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0 {
                YAnchor = 40
            }
            self.lblTitleLabel.frame = CGRect(x: 20, y: YAnchor, width: Int(viewWidth  * 0.8), height: 35)
            self.lblTitleLabel.textAlignment = .left
            self.lblTitleLabel.font = UIFont.systemFont(ofSize: 15)
            self.lblTitleLabel.numberOfLines = 0
            self.lblTitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.lblTitleLabel.setCustomText(text: tilte, font: FontType.OpenSansMedium, size: FontSize.sixteen, color: textColor, style: nil)
            let lblTitleHeight = self.heightForLabel(text: self.lblTitleLabel.text!,
                                                     font: self.lblTitleLabel.font,
                                                     width: self.lblTitleLabel.frame.width)
            self.lblTitleLabel.frame =  CGRect(x: 20, y: YAnchor, width: Int(viewWidth * 0.8), height: Int(lblTitleHeight))
            let lblSubTitleY = self.lblTitleLabel
                .frame.origin.y + lblTitleHeight + 5
            self.lblSubTitleLabel.frame = CGRect(x: 20, y: lblSubTitleY, width: self.lblTitleLabel.frame.width, height: 35)
            self.lblSubTitleLabel.textAlignment = .left
            self.lblSubTitleLabel.font = UIFont.systemFont(ofSize: 15)
            self.lblSubTitleLabel.numberOfLines = 0
            self.lblSubTitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.lblSubTitleLabel.setCustomText(text: subTitle, font: FontType.OpenSansRegular, size: FontSize.sixteen, color: textColor, style: nil)
            let lblSubTitleHeight = self.heightForLabel(text: self.lblSubTitleLabel.text!,
                                                        font: self.lblSubTitleLabel.font,
                                                        width: self.lblTitleLabel.frame.width)
            self.lblSubTitleLabel.frame = CGRect(x: 20, y: lblSubTitleY, width: self.lblTitleLabel.frame.width, height: lblSubTitleHeight)
            let viewHeight = lblSubTitleY + lblSubTitleHeight + 11.0
            self.newView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: viewHeight)
            self.newView.backgroundColor = "EAECEE".colorWithHexString(hex: "EAECEE")
            self.newView.backgroundColor = "fefefe".colorWithHexString(hex: "fefefe")
            
            // self.view.addSubview(self.newView)
            if #available(iOS 13.0, *) {
                if let window = UIApplication.shared.currentWindow {
                    window.addSubview(self.newView)
                }
            } else {
                self.view.addSubview(self.newView)
            }
            
            self.newView.addSubview(self.lblTitleLabel)
            self.newView.addSubview(self.lblSubTitleLabel)
            
            self.view.layoutIfNeeded()
        }) { (_) in
            self.perform(#selector(self.dismissssBanner), with: nil, afterDelay: 1.2)
        }
    }
    
    /* Creating Labels in Banners */
    func heightForLabel(text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    /* Remove Banner from View */
    @objc func dismissssBanner() {
        UIView.animate(withDuration: 1.5, animations: {
            self.newView.frame = CGRect(x: 0, y: -87, width: UIScreen.main.bounds.width, height: 88.0)
        }) { (_) in
            self.newView.removeFromSuperview()
        }
    }
    
    /* Creating Custom Alert */
    func showAlert(message msg: String, title: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            @unknown default:
                print("destructive")
            }}))
        DispatchQueue.main.async() {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /* Setting up Title on navigation */
    func setTitle(title: String, hideTabBar: Bool) {
        self.title = title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.tabBarController?.tabBar.isHidden = hideTabBar
    }
    
    /* Creating image with Bezier */
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return defaultMenuImage
    }
    
    /* Creating Toast Message in all Views */
    func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height - 160, width: 300, height: 35))
        toastLabel.backgroundColor = "EAECEE".colorWithHexString(hex: "EAECEE")
        toastLabel.textColor = ColorCode.titleColor.colorWithHexString(hex: ColorCode.titleColor)
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: FontType.OpenSansRegular, size: 14.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 16
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 8.0, delay: 0.3, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(_) in
            toastLabel.removeFromSuperview()
        })
    }
    
    /* Hiding Keyboard */
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboardonTapAnywhereonView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /* Dismiss Keyboard */
    @objc func dismissKeyboardonTapAnywhereonView() {
        view.endEditing(true)
    }
    
    // MARK: - Slide View - Top To Bottom
    func viewSlideInFromTopToBottom(view: UIView) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        view.layer.add(transition, forKey: kCATransition)
    }
}

extension AppMainVc: InternetStatusProtocol {
    
    // MARK: - Delegate Method For Fetch Data From Server Again
    func fetchDataFromServerAgain(isAPICall: String) { }
    
    /* Creating View if we are getting error from API like "No Data found", "Server Error", "No Internet Connection", etc. */
    func showInternetStatus(view: UIView, type: String) {
        self.internetVc = (Storyboard.common.instantiateViewController(withIdentifier: "InternetStatusVc") as? InternetStatusVc)
        self.internetVc.messageType = type
        self.networkView = UIView(frame: view.frame)
        self.networkView.isHidden = false
        self.networkView.removeFromSuperview()
        self.internetVc.internetDelegate = self
        self.view.addSubview(self.networkView)
        Utility.sharedInstance.setConstraintWithTopPadding(subView: self.networkView, RelateviveToSecondView: view)
        self.networkView.addSubview( self.internetVc.view)
        Utility.sharedInstance.setConstraint(subView: self.internetVc.view, RelateviveToSecondView: self.networkView)
    }
    
    func showCustomInternetStatus(view: UIView, type: String) {
        self.internetVc = (Storyboard.common.instantiateViewController(withIdentifier: "InternetStatusVc") as? InternetStatusVc)
        self.internetVc.messageType = type
        self.networkView = UIView(frame: view.frame)
        self.networkView.isHidden = false
        self.networkView.removeFromSuperview()
        self.internetVc.internetDelegate = self
        self.view.addSubview(self.networkView)
        Utility.sharedInstance.setConstraintWithTopMorePadding(subView: self.networkView, RelateviveToSecondView: view)
        self.networkView.addSubview( self.internetVc.view)
        Utility.sharedInstance.setConstraint(subView: self.internetVc.view, RelateviveToSecondView: self.networkView)
    }
    
    func showSearchCustomInternetStatus(view: UIView, type: String) {
        self.internetVc = (Storyboard.common.instantiateViewController(withIdentifier: "InternetStatusVc") as? InternetStatusVc)
        self.internetVc.messageType = type
        self.networkView = UIView(frame: view.frame)
        self.networkView.isHidden = false
        self.networkView.removeFromSuperview()
        self.internetVc.internetDelegate = self
        self.view.addSubview(self.networkView)
        Utility.sharedInstance.setConstraintWithSearchTopMorePadding(subView: self.networkView, RelateviveToSecondView: view)
        self.networkView.addSubview( self.internetVc.view)
        Utility.sharedInstance.setConstraint(subView: self.internetVc.view, RelateviveToSecondView: self.networkView)
    }
}
