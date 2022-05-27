//
//  Colors.swift
//  HealthHub
//
//  Created by mac on 10/12/2021.
//

import Foundation
import UIKit


func splashBG() -> UIColor{
    return UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
}

func textfieldBorderColor() -> CGColor{
    return UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
}

//func primaryColor() -> UIColor{
//    return UIColor.init(hex: "005949")
//}

enum Colors {
    static var  TextColor = "TextColor"
    static var  ButtonColor = "ButtonColor"
    static var  ButtonBG = "ButtonBG"
    static var  TextfieldBG = "TextfieldBG"
    static var  Textcolormedialbl = "Textcolormedialbl"
    static var  EditCBG = "EditCBG"
    static var  ClientColorBG = "ClientColor"
    static var  ShadowColor = "ShadowColor"
    static var  buttonRed = "buttonRed"
    static var  LightText = "LightText"
    static var  AppColor = "Appcolor"
    static var  PrimaryAppColor = "PrimaryAppColor"
    
    static var  PrimaryAppColor1 = "PrimaryAppColor1"
    static var  AppBGColor = "AppBGColor"
    
}

func semiBold(size: Double) -> UIFont{
    return UIFont(name: "SFProDisplay-Semibold", size: size * appConstant.heightRatio)!
}

func medium(size: Double) -> UIFont{
    return UIFont(name: "SFProDisplay-Medium", size: size * appConstant.heightRatio)!
}


func regular(size: Double) -> UIFont{
    return UIFont(name: "SFProDisplay-Regular", size: size * appConstant.heightRatio)!
}

func bold(size: Double) -> UIFont{
    return UIFont(name: "SFProDisplay-Bold", size: size * appConstant.heightRatio)!
}
