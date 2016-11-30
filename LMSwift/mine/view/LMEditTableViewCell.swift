//
//  LMEditTableViewCell.swift
//  LMSwift
//
//  Created by YUMO on 16/11/28.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMEditTableViewCell: UITableViewCell {

    var title:UILabel?
    var content:UILabel?
    var line:UILabel?
    var imgView: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        title = UILabel.init(frame: CGRect.init(x: MARGIN_15, y:0, width:(SCREEN_WIDTH-MARGIN_30)/2, height: LMEditTableViewCell.height()))
        title?.font = FONT_OF_SIZE_14
        title?.textColor = COLOR_UI_333333
        self.addSubview(title!)
        
        content = UILabel.init(frame: CGRect.init(x:(title?.right)!, y: 0, width:(SCREEN_WIDTH-MARGIN_30)/2 - MARGIN_20, height:LMEditTableViewCell.height()))
        content?.font = FONT_OF_SIZE_14
        content?.textColor = COLOR_UI_333333
        content?.textAlignment = .right
        self.addSubview(content!)
        
        let image = UIImageWithName(name: "icon_arrow1")
        imgView = UIImageView.init(frame: CGRect.init(x: SCREEN_WIDTH-MARGIN_15, y:LMEditTableViewCell.height()/2 - image.size.height/2, width: image.size.width, height: image.size.height))
        imgView?.image = image
        self.addSubview(imgView!)
        
        line = UILabel.init(frame: CGRect.init(x: MARGIN_15, y:LMEditTableViewCell.height() - 1, width:SCREEN_WIDTH, height: 0.5))
        line?.backgroundColor = COLOR_UI_DDDDDD
        self.addSubview(line!)
        
    }
    
    func refresh(titleStr:String,contentStr:String){
        title?.text = titleStr
        content?.text = contentStr
    }
    class func height()->CGFloat{
        return 55
    }

    class func reuseIdentifier()->String{
        return "LMEditTableViewCell"
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
