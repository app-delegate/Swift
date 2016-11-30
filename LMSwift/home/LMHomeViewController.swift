//
//  LMHomeViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/23.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMHomeViewController: LMBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitleWithNavigationTitle(title: "首页")
        self.navigationView?.leftItem?.isHidden = true
        
        let butto = UIButton.init(type: .custom)
        butto.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        butto.backgroundColor = UIColor.red
        butto.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        self.view.addSubview(butto)
        // Do any additional setup after loading the view.
    }
    
    func onButton() {
        
        let vc = LMPayViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc , animated: true)
        
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
