//
//  LMBaseViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/22.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMBaseViewController: UIViewController {
    
    var navigationView:LMNavigationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
        
        navigationView = LMNavigationView.init(frame: CGRect(x:0, y:0, width:SCREEN_WIDTH, height:NAVIGATION_HEIGHT), blockPropertyLeft: {
            self.leftItemAction()
        },blockPropertyRight:{
            self.leftItemAction()
        })
//        navigationView?.leftItem?.setImage(imageNamed(string: "icon_arrow1"), for: .normal)
        self.view.addSubview(navigationView!)
        
        // Do any additional setup after loading the view.
    }
    
    func leftItemAction() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func setTitleWithNavigationTitle(title:String) {
        navigationView?.titleLabel?.text = title
    }
    
    func setLeftItemTitle(title:String) {
        navigationView?.leftItem?.setTitle(title, for: .normal)
    }
    
    func setRightItemTitle(title:String) {
        navigationView?.rightItem?.setTitle(title, for: .normal)
    }
    
    func setRightItemImage(image:String) {
        navigationView?.rightItem?.setImage(UIImageWithName(name: image), for: .normal)
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
