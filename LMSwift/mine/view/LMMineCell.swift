//
//  LMMineCell.swift
//  LMSwift
//
//  Created by YUMO on 16/11/25.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMMineCell: UIView {
    
    var cellView1:LMMineCellView?
    var cellView2:LMMineCellView?
    var line : UILabel?
   
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = COLOR_UI_FFFFFF;
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = COLOR_UI_DDDDDD.cgColor;

        cellView1 = LMMineCellView.init(frame: CGRect.init(x:0, y:0, width:frame.size.width, height: frame.size.height/2))
        self.addSubview(cellView1!)
        
        line = UILabel.init(frame: CGRect(x: 0, y:(cellView1?.bottom)!, width: frame.size.width, height:0.5))
        line?.backgroundColor = COLOR_UI_DDDDDD
        self.addSubview(line!)
        
        cellView2 = LMMineCellView.init(frame: CGRect.init(x:0, y:(cellView1?.bottom)!, width:frame.size.width, height: frame.size.height/2))
        self.addSubview(cellView2!)
        
    }
    
    func refreshCell(array:NSArray,session:Int){
        let arr1 = array.object(at: 0)
        let arr2 = array.object(at: 1)
        
        cellView1?.refresh(titleString:(arr1 as AnyObject).object(at: 0) as! String, contentString: (arr1 as AnyObject).object(at: 1) as! String)
        cellView2?.refresh(titleString:(arr2 as AnyObject).object(at: 0) as! String, contentString: (arr2 as AnyObject).object(at: 1) as! String)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
