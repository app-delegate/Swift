//
//  LMEditNickNameViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/29.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMEditNickNameViewController: LMBaseViewController {

    var textField:UITextField?
    var line:UILabel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setTitleWithNavigationTitle(title: "编辑昵称")
        self.setRightItemTitle(title: "保存")
        
        textField = UITextField.init(frame: CGRect.init(x: MARGIN_15, y: NAVIGATION_HEIGHT + MARGIN_15, width: SCREEN_WIDTH - MARGIN_30, height: 45))
        textField?.textColor = COLOR_UI_333333
        textField?.font = FONT_OF_SIZE_14
        textField?.text = "昵称"
        textField?.clearButtonMode = .whileEditing
        self.view.addSubview(textField!)
        
        line = UILabel.init(frame: CGRect.init(x: MARGIN_15, y: (textField?.bottom)!, width: SCREEN_WIDTH - MARGIN_30, height: 1))
        line?.backgroundColor = COLOR_UI_DDDDDD
        self.view.addSubview(line!)
        
        self.unloadRightItemTextColor()
        
        NotificationCenter.default.addObserver(self, selector: #selector(unloadRightItemTextColor), name: Notification.Name.UITextFieldTextDidChange, object: nil)
    }
    
    func unloadRightItemTextColor() {
        if textField?.text?.characters.count == 0{
            self.navigationView?.rightItem?.isEnabled = false
            self.navigationView?.rightItem?.setTitleColor(COLOR_UI_EEEEEE.withAlphaComponent(0.5), for: .normal)
        } else {
            self.navigationView?.rightItem?.isEnabled = true
            self.navigationView?.rightItem?.setTitleColor(COLOR_UI_FFFFFF, for: .normal)
        }

    }
   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField?.resignFirstResponder()
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
