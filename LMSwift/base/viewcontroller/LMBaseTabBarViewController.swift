//
//  LMBaseTabBarViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/23.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMBaseTabBarViewController: UITabBarController {
    
    var mine:LMMineViewController?
    var home:LMHomeViewController?
    var message:LMMessageListViewController?
    
    var navMine:LMNavigationViewController?
    var navHome:LMNavigationViewController?
    var navMessage:LMNavigationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        home = LMHomeViewController(nibName: nil, bundle: nil)
        message = LMMessageListViewController(nibName: nil, bundle: nil)
        mine  = LMMineViewController(nibName: nil, bundle: nil)
        
        navHome = LMNavigationViewController(rootViewController: home!)
        navMessage = LMNavigationViewController(rootViewController: message!)
        navMine = LMNavigationViewController(rootViewController: mine!)
        
        navHome?.tabBarItem.image = UIImageWithName(name: "icon_shipin1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navHome?.tabBarItem.selectedImage = UIImageWithName(name: "icon_shipin").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navHome?.tabBarItem.title = "视频"
        
        navMessage?.tabBarItem.image = UIImageWithName(name: "icon_xiaoxi1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navMessage?.tabBarItem.selectedImage = UIImageWithName(name: "icon_xiaoxi").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navMessage?.tabBarItem.title = "消息"
        navMine?.tabBarItem.image = UIImageWithName(name: "icon_wode1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navMine?.tabBarItem.selectedImage = UIImageWithName(name: "icon_wode").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navMine?.tabBarItem.title = "我的"
        
        self.viewControllers = [navHome!,navMessage!,navMine!]
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:COLOR_UI_777777], for:.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: COLOR_UI_F9586F], for:.selected)
        
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
