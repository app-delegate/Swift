//
//  LMEditHeadImageCell.swift
//  LMSwift
//
//  Created by YUMO on 16/11/28.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMEditHeadImageCell: UITableViewCell {

    var title:UILabel?
    var imgView: UIImageView?
    var line:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title = UILabel.init(frame: CGRect.init(x: MARGIN_15, y:0, width:(SCREEN_WIDTH-MARGIN_30)/2, height: LMEditHeadImageCell.height()))
        title?.font = FONT_OF_SIZE_14
        title?.textColor = COLOR_UI_333333
        self.addSubview(title!)
        
        imgView = UIImageView.init(frame: CGRect.init(x:SCREEN_WIDTH - LMEditHeadImageCell.height() , y: MARGIN_15, width:LMEditHeadImageCell.height() - MARGIN_30, height:LMEditHeadImageCell.height() - MARGIN_30))
        imgView?.layer.cornerRadius = (imgView?.size.height)!/2
        imgView?.clipsToBounds = true
        self.addSubview(imgView!)
        
        line = UILabel.init(frame: CGRect.init(x: MARGIN_15, y:LMEditHeadImageCell.height() - 1, width:SCREEN_WIDTH, height: 0.5))
        line?.backgroundColor = COLOR_UI_DDDDDD
        self.addSubview(line!)
        
    }
    
    func refresh(image:UIImage){
        title?.text = "头像"
        imgView?.image = image
    }
    
    class func height()->CGFloat{
        return 100
    }
    
    class func reuseIdentifier()->String{
        return "LMEditHeadImageCell"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
