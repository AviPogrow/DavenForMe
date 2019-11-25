//
//  Config.swift
//  Daven4Me
//


import UIKit


/*
‫
‫תהילים‬//
‫
*/

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

let  blueColor = UIColor(displayP3Red: 4, green: 149, blue: 255, alpha: 1)
let secondColor = UIColor.lightGray
  //Red: 4, Green: 169, Blue: 235.


func insertDirectionIsolates(userName: Person) -> String {
      
      let aviStringHeb = userName.nameToDisplay
      
      let timeInterval = userName.timeStamp.timeAgoDisplay()
      
      let addedByAviSubString =
      String.localizedStringWithFormat(
         NSLocalizedString("added by %@ - %@",
                           comment: "added by user label"), aviStringHeb, timeInterval)
      let scalars = String.localizedStringWithFormat(addedByAviSubString)
            .unicodeScalars.map { "U+\(String(format: "%04X", $0.value))" }
      
      //Under the hood of the localized string with format we see two Unicode Characters around the hebrew

      //2068 - First String Isolate
      //2069 - Pop Directional Isolate
      
      print(scalars)
      
      return addedByAviSubString
      
  }
  
  
  func manuelInsertDirectionaIsolates(person: Person) -> String {
      
      let timeInterval = person.timeStamp.timeAgoDisplay()
      
      // add unicode directional character
            let lightWeightLTR = "\u{200E}"

      var  aviStringHeb = person.nameToDisplay
        
            let addedBy = "added by - "
            let userName = aviStringHeb
            let timeInterv = timeInterval
            let spaceDashSpace = " - "

            let strongRTLIsolate = "\u{2066}"

      
  let aviString2 = "\(strongRTLIsolate)" + " " + addedBy + "\(aviStringHeb)" + spaceDashSpace + "\(strongRTLIsolate)" + " " + timeInterv
  
   return aviString2
  }

   




extension UIDevice {
    
    // is this an iphoneX?
    // return true if main.height is 2436
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    
    // is this a phone?
    // UIDevice.iphone returns true if idiom is .phone
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    // enum with cases and string values per case
    // this enum is a switch statement that returns the screenType
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR = "iPhone XR"
        case iPhone_XSMax = "iPhone XS Max"
        case unknown
    }
    
    
    // given a points value for UIScreen.height
    // we switch on that to return the screenType
    // screenType is an enum case
    //
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
}
