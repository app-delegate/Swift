//
//  LMMessageListCell.swift
//  LMSwift
//
//  Created by YUMO on 16/11/24.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMMessageListCell: UITableViewCell {

    var imgView:UIImageView?
    var nameLabel:UILabel?
    var contentLabel:UILabel?
    var timeLabel:UILabel?
    
    
    //初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let imgHeight:CGFloat = 60.0
        
        imgView = UIImageView.init(frame: CGRect.init(x: MARGIN_15, y:MARGIN_15, width:imgHeight, height: imgHeight))
        imgView?.layer.cornerRadius = imgHeight/2
        self.addSubview(imgView!)
        
        nameLabel = UILabel.init(frame: CGRect.init(x:(imgView?.right)! + MARGIN_15, y: (imgView?.top)!, width:0, height:MARGIN_20))
        nameLabel?.font = FONT_OF_SIZE_14
        nameLabel?.textColor = COLOR_UI_333333
        self.addSubview(nameLabel!)
        
        contentLabel = UILabel.init(frame: CGRect.init(x:(imgView?.right)! + MARGIN_15, y: (nameLabel?.bottom)!, width:SCREEN_WIDTH - (imgView?.right)! - MARGIN_30, height:MARGIN_20))
        contentLabel?.font = FONT_OF_SIZE_12
        contentLabel?.textColor = COLOR_UI_777777
        self.addSubview(contentLabel!)
        
        timeLabel = UILabel.init()
        timeLabel?.top = (imgView?.top)!;
        timeLabel?.height = MARGIN_20
        timeLabel?.font = FONT_OF_SIZE_12
        timeLabel?.textColor = COLOR_UI_333333
        self.addSubview(timeLabel!)
        
    }
    
    //类方法
    class func heightWithCell()->CGFloat{
        return 90
    }
    
    func cellForModel(title:String,content:String,time:String){
        
        imgView?.image = UIImageWithName(name:"touxiang")
        
        nameLabel?.text = title
        contentLabel?.text = content
        timeLabel?.text = time
        
        timeLabel?.sizeToFit()
        timeLabel?.height = MARGIN_20
        timeLabel?.right = SCREEN_WIDTH - MARGIN_15

        nameLabel?.width = SCREEN_WIDTH - (imgView?.right)! - MARGIN_30 - (timeLabel?.width)!
        nameLabel?.right = (timeLabel?.left)!
    }
    
    class func reuseIdentifier()->String{
        return "LMMessageListCell"
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
