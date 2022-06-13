//
//  MenuDropDownListVC.swift
//  SampleProject
//
//  Created by apple on 15/04/22.
//

import Foundation
import UIKit

protocol MenuDropDownProtocol: AnyObject {
    func getSelectIndex(index: Int, value: String, totalCount: Int)
}

class MenuDropDownListVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tblMenuDropDownList: UITableView!
    @IBOutlet weak var baseView: UIView!
    
    // MARK: - Variables
    weak var delegate: MenuDropDownProtocol?
    var dropDownList: [String] = ["Add", "Delete"]
    var selectItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblMenuDropDownList.isScrollEnabled = false
        self.tblMenuDropDownList.dataSource = self
        self.tblMenuDropDownList.delegate = self
        self.tblMenuDropDownList.reloadData()
        self.view.backgroundColor = ColorCode.white.colorWithHexString(hex: ColorCode.white)
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        self.doInitialize()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
       if #available(iOS 13.0, *) {
           return .darkContent
       } else {
           // Fallback on earlier versions
           return .default
       }
    }
    
    // MARK: - User Functions
    func doInitialize() {
        self.baseView.backgroundColor = ColorCode.white.colorWithHexString(hex: ColorCode.white)
        self.tblMenuDropDownList.backgroundColor = ColorCode.white.colorWithHexString(hex: ColorCode.white)
        self.baseView.addCustomBorder(cornerRadius: RoundRadius.four,
                                      backGroundColor: ColorCode.white,
                                      borderWidth: PixelSize.one,
                                      borderColor: ColorCode.popUpBorder)
        self.baseView.addShadow(shadowColor: ColorCode.shadowColor.colorWithHexString(hex: ColorCode.shadowColor),
                                cornerRadius: nil,
                                backGroundColor: nil)
    }
}

extension MenuDropDownListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuDropDownListCell", for: indexPath) as? MenuDropDownListCell {
            cell.lblItem.setCustomText(text: self.dropDownList[indexPath.row],
                                       font: FontType.OpenSansRegular,
                                       size: FontSize.thirteen,
                                       color: ColorCode.textColor,
                                       style: nil)
            cell.lblLineDivider.backgroundColor = ColorCode.lineColor.colorWithHexString(hex: ColorCode.lineColor)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false, completion: nil)
        self.delegate?.getSelectIndex(index: indexPath.row,
                                      value: self.dropDownList[indexPath.row],
                                      totalCount: self.dropDownList.count)
    }
}

class AlwaysPresentAsPopover: NSObject, UIPopoverPresentationControllerDelegate {
    
    // `sharedInstance` because the delegate property is weak - the delegate instance needs to be retained.
    private static let sharedInstance = AlwaysPresentAsPopover()
    
    private override init() {
        super.init()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    static func configurePresentation(forController controller: UIViewController) -> UIPopoverPresentationController {
        controller.modalPresentationStyle = .popover
        let presentationController = controller.presentationController as? UIPopoverPresentationController
        presentationController?.delegate = AlwaysPresentAsPopover.sharedInstance
        return presentationController!
    }
    
}
