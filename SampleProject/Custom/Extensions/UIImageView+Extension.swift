//
//  UIImageView+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit
import FLAnimatedImage

extension UIImageView {
    
    // MARK: - use it for calculating the height of images and set to the row heights of the tableview.
    func getAspectRatio(url:String, type:String) -> CGFloat {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            imageView.sd_setImage(with: URL(string: url), completed: nil)
            guard let image = imageView.image else {  return 0  }
            return CGFloat(((UIScreen.main.bounds.width * image.size.height) / (image.size.width)))
        }
    
    // MARK: - find an aspect fit image’s size inside an image view
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let imgX = (bounds.width - size.width) / 2.0
        let imgY = (bounds.height - size.height) / 2.0
        
        return CGRect(x: imgX, y: imgY, width: size.width, height: size.height)
    }
    
    // MARK: - find an aspect fit image’s size inside an image view
    var contentAspectFitImage: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let imgX = (bounds.width - size.width) / 2.0
        let imgY = (bounds.height - size.height) / 2.0
        
        return CGRect(x: imgX, y: imgY, width: size.width, height: size.height)
    }
    
    // MARK: - Creating imageview into circular
    func setProfileRoundImage(size: CGFloat) {
        self.layer.cornerRadius = UIScreen.main.bounds.width * size
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    // MARK: - Flip image when Arabic language Selected
    func flipImage() {
        if AppModelUtils.sharedInstance.isFlip {
            self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        } else {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    // MARK: - Changing Image color
    func tintImageColor(color: UIColor) {
        
        if self.image != nil {
            self.image = self.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            self.tintColor = color }
    }
    
    /* Applying Shadow to imageView ith corner radius */
    func applyShadow(shadowColor: UIColor, cornerRadius: String?, backGroundColor: String?) {
        if let bgColor = backGroundColor {
            self.backgroundColor = bgColor.colorWithHexString(hex: bgColor)
        }
        if let cornerRadius = cornerRadius?.CGFloatValue() {
            self.layer.cornerRadius = cornerRadius
        }
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = .init(width: 1, height: 1)
        self.layer.shadowRadius = 3.0
    }
    
    func setUpImageData(imageName: String, isSelected: Bool) {
        if isSelected {
            self.image = UIImage(named: imageName)
//            self.tintImageColor(color: ColorCode.activeColor.colorWithHexString(hex: ColorCode.activeColor))
        } else {
            self.image = UIImage(named: imageName)
//            self.tintImageColor(color: ColorCode.inActiveColor.colorWithHexString(hex: ColorCode.inActiveColor))
        }
    }
}

// MARK: FLAnimatedImageView Extension
extension FLAnimatedImageView {
    // MARK: - Creating any image into Gif 
    func loadGIF(url: URL) {
        if let urlData = AppModelUtils.sharedInstance.imageCache.object(forKey: url as AnyObject) as? Data {
            
            self.animatedImage = FLAnimatedImage(gifData: urlData)
        } else {
            AppModelUtils.sharedInstance.getData(from: url) { (data, _, _) in
                DispatchQueue.global().async { [weak self] in
                    DispatchQueue.main.async {
                        self!.animatedImage = FLAnimatedImage(gifData: data)
                        AppModelUtils.sharedInstance.imageCache.setObject(data as AnyObject, forKey: url as AnyObject )
                    }
                }
            }
        }
    }
}
