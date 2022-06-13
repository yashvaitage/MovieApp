//
//  InternetStatusVc.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import UIKit

protocol InternetStatusProtocol: AnyObject {
    // MARK: - if isAPICall flag is 1 then we need to call API
    // MARK: - if isAPICall is 0 then we need to redirect to the HomePage
    // MARK: - if "" then nothing
    func fetchDataFromServerAgain(isAPICall: String)
}

class InternetStatusVc: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    
    // MARK: - Variables
    var messageType = ""
    var titleName = ""
    var desName = ""
    var tryAgain = "Try Again"
    weak var internetDelegate: InternetStatusProtocol?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if topConstraints != nil {
            topConstraints.constant =  -((UIScreen.main.bounds.height * 0.11) - 10)
        }
        
        self.view.backgroundColor = ColorCode.white.colorWithHexString(hex: ColorCode.white)
        self.btnOk.setCustomText(text: "",
                                 font: FontType.OpenSansMedium,
                                 size: FontSize.thirteen,
                                 color: ColorCode.white,
                                 style: nil,
                                 backgroundColor: ColorCode.blue,
                                 cornerRadius: RoundRadius.regular)
        
        if messageType == ErrorImagesParameters.NotificationError {
            titleName = ""
            self.btnOk.isHidden = true
            self.imgView.image = UIImage(named: "icNotificationError")
        } else if messageType == ErrorImagesParameters.ServerError {
            self.btnOk.isHidden = false
            self.imgView.image = UIImage(named: "icServerError")
            titleName = ""
            self.btnOk.setTitle(tryAgain, for: .normal)
            
        } else if messageType == ErrorImagesParameters.NoDataFoundError {
            titleName = ""
            self.btnOk.isHidden = true
            self.imgView.image = UIImage(named: "icDataError")
        } else if messageType == ErrorImagesParameters.CartError {
            self.btnOk.isHidden = true
            self.imgView.image = UIImage(named: "icCartError")
            titleName = ""
            desName = ""
        } else if messageType == ErrorImagesParameters.SearchError {
            self.imgView.image = UIImage(named: "icResultError")
            
        } else if messageType == ErrorImagesParameters.NoOrderError {
            desName = ""
            titleName = ""
            self.btnOk.isHidden = true
            self.imgView.image = UIImage(named: "icOrderError")
        } else if messageType == ErrorImagesParameters.productError {
            
            desName = ""
            titleName = ""
            self.btnOk.isHidden = true
            self.imgView.image = UIImage(named: "productError")
        } else if messageType == ErrorImagesParameters.InternectionError {
            self.btnOk.isHidden = false
            
            self.imgView.image = UIImage(named: "icInternetError")
            titleName = ""
            self.btnOk.setTitle(tryAgain, for: .normal)
            
        } else if messageType == ErrorImagesParameters.TimeOutError {
            self.btnOk.isHidden = false
            
            self.imgView.image = UIImage(named: "icServerError")
            titleName = ""
            self.btnOk.setTitle(tryAgain, for: .normal)
            
        } else {
            self.imgView.image = UIImage(named: "icDataError")
            titleName = ""
            desName = messageType
            self.btnOk.isHidden = true
        }
        self.lblTitle.setCustomText(text: titleName,
                                    font: FontType.OpenSansRegular,
                                    size: FontSize.thirteen,
                                    color: ColorCode.gray,
                                    style: nil)
    }
    
    // MARK: - Button Methods
    @IBAction func btnOkClicked(_ sender: Any) {
        self.view.removeFromSuperview()
        
        switch messageType {
        case ErrorImagesParameters.ServerError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "1")
            
        case ErrorImagesParameters.CartError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "0")
            
        case ErrorImagesParameters.InternectionError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "1")

        case ErrorImagesParameters.NotificationError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "")

        case ErrorImagesParameters.NoDataFoundError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "")

        case ErrorImagesParameters.SearchError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "")

        case ErrorImagesParameters.NoOrderError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "")

        case ErrorImagesParameters.TimeOutError:
            internetDelegate?.fetchDataFromServerAgain(isAPICall: "1")

        default:
            print("")
        }
    }
}
