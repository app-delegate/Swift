//
//  LMMineHeaderView.swift
//  LMSwift
//
//  Created by YUMO on 16/11/28.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMMineHeaderView: UIView {

    
    var bgImageView:UIImageView?
    var headImg:UIImageView?
    var nickName:UILabel?
    var idLabel:UILabel?
    var friendLabel:UILabel?
    var line:UILabel?
    var followLabel:UILabel?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        bgImageView = UIImageView.init(frame: frame)
        bgImageView?.image = UIImageWithName(name: "beijing.jpg")
        self.addSubview(bgImageView!)
        
        headImg = UIImageView.init(frame: CGRect.zero)
        headImg?.top = 55
        headImg?.size = CGSize.init(width: 90, height: 90)
        headImg?.centerX = self.centerX;
        headImg?.image = UIImageWithName(name: "touxiang")
        self.addSubview(headImg!)
        
        nickName = UILabel.init(frame: CGRect.init(x: MARGIN_20, y:(headImg?.bottom)! + MARGIN_5, width:frame.size.width - MARGIN_20*2, height: MARGIN_25))
        nickName?.font = FONT_OF_SIZE_14
        nickName?.textColor = COLOR_UI_FFFFFF
        nickName?.textAlignment = NSTextAlignment.center
        self.addSubview(nickName!)
        
        idLabel = UILabel.init(frame: CGRect.init(x: MARGIN_20, y:(nickName?.bottom)!, width:frame.size.width - MARGIN_20*2, height: MARGIN_20))
        idLabel?.font = FONT_OF_SIZE_12
        idLabel?.textColor = COLOR_UI_FFFFFF
        idLabel?.textAlignment = NSTextAlignment.center
        self.addSubview(idLabel!)
        
        friendLabel = UILabel.init(frame: CGRect.zero)
        friendLabel?.font = FONT_OF_SIZE_12
        friendLabel?.textColor = COLOR_UI_FFFFFF
        friendLabel?.textAlignment = NSTextAlignment.center
        self.addSubview(friendLabel!)
     
        line = UILabel.init(frame: CGRect.zero)
        line?.backgroundColor = COLOR_UI_FFFFFF
        line?.height = MARGIN_15
        line?.width = 1
        self.addSubview(line!)
        
        followLabel = UILabel.init(frame: CGRect.zero)
        followLabel?.font = FONT_OF_SIZE_12
        followLabel?.textColor = COLOR_UI_FFFFFF
        followLabel?.textAlignment = NSTextAlignment.center
        self.addSubview(followLabel!)

        
        
    }
    
    func refresh(){
        
        nickName?.text = "Qly"
        idLabel?.text = "id：" + "123456"
        
        friendLabel?.text = "1" + "我喜欢的"
        followLabel?.text = "2" + "喜欢我的"
        
        friendLabel?.sizeToFit()
        followLabel?.sizeToFit()
        
        followLabel?.top = (idLabel?.bottom)! + MARGIN_15
        friendLabel?.top = (followLabel?.top)!
        
        let margin = (self.frame.size.width - (followLabel?.width)! - (friendLabel?.width)! - (line?.width)! - MARGIN_30)/2
        friendLabel?.left = margin
        
        line?.left = MARGIN_15 + (friendLabel?.right)!
        line?.top = (followLabel?.top)!
        followLabel?.left = (line?.right)! + MARGIN_15
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
