//
//  LMToolObj.swift
//  LMSwift
//
//  Created by YUMO on 16/11/22.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let itemWight:CGFloat = 64.0
let itemHeight:CGFloat = 64.0

let TABBAR_HEIGHT:CGFloat = 49.0
let NAVIGATION_HEIGHT:CGFloat = 64.0

let imageNamed:String = "skin_needed.bundle/image/"

let COLOR_UI_F9586F = transferStringToColor(colorStr:"F9586F")
let COLOR_UI_777777 = transferStringToColor(colorStr:"777777")
let COLOR_UI_333333 = transferStringToColor(colorStr:"333333")
let COLOR_UI_F3F3F3 = transferStringToColor(colorStr:"F3F3F3")
let COLOR_UI_FFFFFF = transferStringToColor(colorStr:"ffffff")
let COLOR_UI_DDDDDD = transferStringToColor(colorStr:"DDDDDD")
let COLOR_UI_EEEEEE = transferStringToColor(colorStr:"EEEEEE")

let IS_IPHONE4 = ((480 == SCREEN_HEIGHT) ? true : false)
let IS_IPHONE5 = ((568 == SCREEN_HEIGHT) ? true : false)
let IS_IPhone6 = ((667 == SCREEN_HEIGHT) ? true : false)
let IS_IPhone6plus = ((736 == SCREEN_HEIGHT) ? true : false)


func COLOR_UI_RANDOM()->UIColor{
    
    return UIColor.init(red: CGFloat(arc4random_uniform(255))/255.0, green:CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1)
}

func TASTE_FONT(s:CGFloat)->UIFont{
    return  UIFont.systemFont(ofSize: s)
}

func UIImageWithName(name:String) -> UIImage
{
    return UIImage.init(named: imageNamed + name)!
}

let FONT_OF_SIZE_17 = TASTE_FONT(s:17)
let FONT_OF_SIZE_16 = TASTE_FONT(s:16)
let FONT_OF_SIZE_15 = TASTE_FONT(s:15)
let FONT_OF_SIZE_14 = TASTE_FONT(s:14)
let FONT_OF_SIZE_13 = TASTE_FONT(s:13)
let FONT_OF_SIZE_12 = TASTE_FONT(s:12)
let FONT_OF_SIZE_10 = TASTE_FONT(s:10)


let MARGIN_35:CGFloat = 35.0
let MARGIN_30:CGFloat = 30.0
let MARGIN_25:CGFloat = 25.0
let MARGIN_20:CGFloat = 20.0
let MARGIN_15:CGFloat = 15.0
let MARGIN_10:CGFloat = 10.0
let MARGIN_8:CGFloat = 8.0
let MARGIN_5:CGFloat = 5.0


func transferStringToColor(colorStr:String) -> UIColor {
    
    var color = UIColor.red
    var cStr : String = colorStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    //去除#
    if cStr.hasPrefix("#") {
        let index = cStr.index(after: cStr.startIndex)
        cStr = cStr.substring(from: index)
    }
    //如果传入的字符串,位数不足6位
    if cStr.characters.count != 6 {
        return UIColor.black
    }
    
    //两种不同截取字符串的方法
    //红色
    let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
    let rStr = cStr.substring(with: rRange)
    
    //绿色
    let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
    let gStr = cStr.substring(with: gRange)
    
    //蓝色
    let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
    let bStr = cStr.substring(from: bIndex)
    
    //颜色转换
    color = UIColor.init(colorLiteralRed: Float(changeToInt(numStr: rStr)) / 255, green: Float(changeToInt(numStr: gStr)) / 255, blue: Float(changeToInt(numStr: bStr)) / 255, alpha: 1)
    return color
}

func changeToInt(numStr:String) -> Int {
    
    //转换为大写字母
    let str = numStr.uppercased()
    var sum = 0
    for i in str.utf8 {
        //0-9 从48开始
        sum = sum * 16 + Int(i) - 48
        if i >= 65 {
            //A~Z 从65开始，但初始值为10
            sum -= 7
        }
    }
    return sum
}



class LMToolObj: NSObject {
    
}
