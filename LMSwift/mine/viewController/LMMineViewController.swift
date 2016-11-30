//
//  LMMineViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/23.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMMineViewController: LMBaseViewController {
    
    var scrollView:UIScrollView?
    var headView:LMMineHeaderView?
    var cellView1:LMMineCell?
    var cellView2:LMMineCell?
    var mineObj:JSONMineObj!
    var editButton:UIButton?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationView?.isHidden = true
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scrollView?.backgroundColor = COLOR_UI_F3F3F3
        
        if IS_IPHONE4 || IS_IPHONE5 {
            scrollView?.contentSize = CGSize.init(width: SCREEN_WIDTH, height: SCREEN_HEIGHT + 100)
        } else {
            scrollView?.contentSize = CGSize.init(width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        }
        self.view?.addSubview(scrollView!)
        
        headView = LMMineHeaderView.init(frame: CGRect.init(x: 0, y:0, width:SCREEN_WIDTH, height:240))
        headView?.refresh()
        scrollView?.addSubview(headView!)
        
        editButton = UIButton.init(type: .custom)
        editButton?.frame = CGRect.init(x: 0, y:0, width:NAVIGATION_HEIGHT, height:NAVIGATION_HEIGHT)
        editButton?.imageEdgeInsets = UIEdgeInsetsMake(20,0,0, 0)
        editButton?.setImage(UIImageWithName(name: "icon_bianji"), for: .normal)
        editButton?.addTarget(self, action: #selector(onEditAction), for: .touchUpInside)
        scrollView?.addSubview(editButton!)
        
        cellView1 = LMMineCell.init(frame: CGRect(x: MARGIN_15, y:(headView?.bottom)! + MARGIN_25, width:SCREEN_WIDTH - MARGIN_30, height:80))
        scrollView?.addSubview(cellView1!)
        
        cellView2 = LMMineCell.init(frame: CGRect(x: MARGIN_15, y:(cellView1?.bottom)! + MARGIN_20, width:SCREEN_WIDTH - MARGIN_30, height:80))
        scrollView?.addSubview(cellView2!)
        
        var array2 = NSArray()
        array2 = [["0-0","0-1"],["1-0","1-1"]]
        cellView1?.refreshCell(array: array2 as NSArray, session:0)
        
        array2 = [["1-0","1-1"],["1-0","1-1"]]
        cellView2?.refreshCell(array: array2 as NSArray, session:0)
        
    }
    
    func onEditAction(){
        
        let vc = LMEditProfileViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
