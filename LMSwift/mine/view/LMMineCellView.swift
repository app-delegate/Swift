//
//  LMMineCellView.swift
//  LMSwift
//
//  Created by YUMO on 16/11/25.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

let CEEL_HEIGHT:CGFloat = 40.0

class LMMineCellView: UIButton {
    
    var title:UILabel?
    var content:UILabel?
  
    var imgView:UIImageView?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        title = UILabel.init(frame: CGRect.init(x:MARGIN_10, y:0, width:frame.size.width/2 - MARGIN_10, height:CEEL_HEIGHT))
        title?.textColor = COLOR_UI_333333
        title?.font = FONT_OF_SIZE_14
//        title?.backgroundColor = COLOR_UI_RANDOM()
        self.addSubview(title!)
        
        imgView = UIImageView.init(frame: CGRect.zero)
        imgView?.image = UIImageWithName(name: "icon_arrow1")
        imgView?.right = self.right - MARGIN_15
        imgView?.top = CEEL_HEIGHT/2 - (imgView?.image?.size.height)!/2
        imgView?.size = (imgView?.image?.size)!
        self.addSubview(imgView!)
        
        content = UILabel.init(frame: CGRect.zero)
        content?.textColor = COLOR_UI_333333
        content?.font = FONT_OF_SIZE_14
//        content?.backgroundColor = COLOR_UI_RANDOM()
        content?.textAlignment = NSTextAlignment.right
        content?.left = (title?.right)!
        content?.height = CEEL_HEIGHT
        content?.width = (title?.width)! - (imgView?.size.width)! - MARGIN_15
        self.addSubview(content!)
        
    }
    
    func refresh(titleString:String,contentString:String){
        title?.text = titleString
        content?.text = contentString
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    

}
