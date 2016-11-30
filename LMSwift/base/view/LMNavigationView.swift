//
//  LMNavigationView.swift
//  LMSwift
//
//  Created by YUMO on 16/11/22.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit


typealias leftBlock = () -> Void
typealias rightBlock = () -> Void

class LMNavigationView: UIView {
    
    var leftItem:UIButton? = nil
    var rightItem:UIButton? = nil
    var titleLabel:UILabel? = nil
    
    var blockLeft :leftBlock?
    var blockRight :rightBlock?

    override init(frame: CGRect) {
        super.init(frame: frame)
        //do something what you want
    }
    
    init(frame:CGRect,blockPropertyLeft:@escaping leftBlock,blockPropertyRight: @escaping rightBlock){
        super.init(frame: frame)
        
        self.backgroundColor = COLOR_UI_F9586F
        
        blockLeft = blockPropertyLeft
        blockRight = blockPropertyRight
        
        leftItem = UIButton.init(type: UIButtonType.custom)
        leftItem?.frame = CGRect(x: 0, y: 0, width: itemWight, height: itemHeight)
        leftItem?.setImage(UIImage.init(named:imageNamed+"icon_arrow2"), for: .normal)
        leftItem?.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 20)
        leftItem?.titleEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        //leftItem?.addTarget(self, action:#selector(onLeftItemAction(_:)), for:.touchUpInside)
        leftItem?.addTarget(self, action:#selector(onLeftItemAction), for:.touchUpInside)
        self.addSubview(leftItem!)
        
        
        rightItem = UIButton.init(type: .custom)
        rightItem?.frame = CGRect(x:SCREEN_WIDTH - itemWight, y: 0, width: itemWight, height: itemHeight)
        rightItem?.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 20)
        rightItem?.titleEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        rightItem?.addTarget(self, action: #selector(onRightItemAction), for:.touchUpInside)
        rightItem?.titleLabel?.font = FONT_OF_SIZE_14
        self.addSubview(rightItem!)
        
        
        titleLabel = UILabel.init(frame: CGRect(x: itemWight, y:20, width:SCREEN_WIDTH - (itemWight*2), height: itemHeight-20))
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        titleLabel?.textColor = UIColor.white
        titleLabel?.textAlignment = NSTextAlignment.center
        self.addSubview(titleLabel!)
    }
    
    
    func onLeftItemAction(){
       
        if (blockLeft != nil) {
            blockLeft!()
        }
    }
    
    func onRightItemAction() {
        if (blockRight != nil) {
            blockRight!()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
