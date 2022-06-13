//
//  Constants.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

// MARK: - Storyboards
struct Storyboard {
    static var productDetail: UIStoryboard {
        return UIStoryboard(name: "ProductDetails", bundle: Bundle.main)
    }
    static var loginSignUp: UIStoryboard {
        return UIStoryboard(name: "Authantication", bundle: Bundle.main)
    }
    static var tabbar: UIStoryboard {
        return UIStoryboard(name: "Tabbar", bundle: Bundle.main)
    }
    static var common: UIStoryboard {
        return UIStoryboard(name: "Common", bundle: Bundle.main)
    }
    static var Account: UIStoryboard {
        return UIStoryboard(name: "Account", bundle: Bundle.main)
    }
    static var Orders: UIStoryboard {
        return UIStoryboard(name: "Order", bundle: Bundle.main)
    }
}

// MARK: - AppUIConstants
struct AppUIConstants {
    static let componentProductImageHeights  = UIScreen.main.bounds.height * 0.6
    static let profilePicSmallBorderWidth: CGFloat = 1.0
}

// MARK: - Comman
struct Comman {
    static let objAppDelegate = UIApplication.shared.delegate as? AppDelegate
    static let countryCode = "+973"
}

// MARK: - Bundle Type
struct BundleType {
    static let plist = "plist"
    static let json  = "json"
}

struct ColorCode {
    static let white          = "#FFFFFF"
    static let black          = "#000000"
    static let titleColor     = "#212121"
    static let textColor      = "#212121"
    static let lineColor      = "#E7E7ED"
    static let blue           = "#062D7A"
    static let red            = "#D9001A"
    static let gray           = "#666666"
    static let lightGray      = "#6B6C7D"
    static let checked        = "#062D7A"
    static let unChecked      = "#DFE3E8"
    static let navBgColor     = "#FFFFFF"
    static let navLineColor   = "#E7E7ED"
    static let borderColor    = "#C7CAD1"
    static let imageGray      = "#9D9DA2"
    static let noteTitle      = "#0E0001"
    static let noteText       = "#A1A1A1"
    static let shadowColor    = "#F0F0F0"
    static let popUpBorder    = "#DFE3E8"
    static let activeColor    = "#062D7A"
    static let inActiveColor  = "#DFE3E8"
    static let headerBgColor  = "#F7F7F7"
    static let levelBgColor   = "#F9F9F9"
    static let level1BgColor  = "#F2F4F8"
    static let dotColor       = "#042c78"
    static let lightGreen     = "#218E0E"
    static let titleBlue     = "#142461"

}

struct FontType {
    static let OpenSansRegular    = "OpenSans-Regular"
    static let OpenSansSemiBold   = "OpenSans-SemiBold"
    static let OpenSansMedium     = "OpenSans-Medium"
    static let OpenSansBold       = "OpenSans-Bold"
    static let LatoBlack          = "Lato-Black"
    static let LatoBlackItalic    = "Lato-BlackItalic"
    static let LatoBold           = "Lato-Bold"
    static let LatoBoldItalic     = "Lato-BoldItalic"
    static let LatoItalic         = "Lato-Italic"
    static let LatoLight          = "Lato-Light"
    static let LatoLightItalic    = "Lato-LightItalic"
    static let LatoRegular        = "Lato-Regular"
    static let LatoThin           = "Lato-Thin"
    static let LatoThinItalic     = "Lato-ThinItalic"
}

struct FontSize {
    static let ten        = "10"
    static let eleven     = "11"
    static let twelve     = "12"
    static let thirteen   = "13"
    static let fourteen   = "13"
    static let fifteen    = "15"
    static let sixteen    = "16"
    static let seventeen  = "17"
    static let nineteen  = "19"
    static let twentyTwo  = "22"
    static let twentyFour = "24"
}

struct PixelSize {
    static let zero  = "0"
    static let half  = "0.5"
    static let one   = "1"
    static let two   = "2"
}

struct RoundRadius {
    static let four    = "4"
    static let eight   = "8"
    static let regular = "20"
}
