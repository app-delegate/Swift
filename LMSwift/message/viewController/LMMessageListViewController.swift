//
//  LMMessageListViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/23.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMMessageListViewController: LMBaseViewController, UITableViewDelegate,UITableViewDataSource {

    
    var tableView:UITableView?
    var dataScoure : NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataScoure = NSMutableArray()
        dataScoure?.add("cell0")
        dataScoure?.add("cell1")
        dataScoure?.add("cell2")
        dataScoure?.add("cell3")
        dataScoure?.add("cell5")
        dataScoure?.add("cell6")
        
        self.setTitleWithNavigationTitle(title: "消息")
        self.navigationView?.leftItem?.isHidden = true
        self.createTableView()
    }
    
    func createTableView() {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y:NAVIGATION_HEIGHT, width:SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATION_HEIGHT - TABBAR_HEIGHT), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: LMMessageListCell.reuseIdentifier()) as? LMMessageListCell
        
        if cell == nil {
            cell = LMMessageListCell(style: .default, reuseIdentifier: LMMessageListCell.reuseIdentifier())
            cell?.selectionStyle = .none
        }
        cell?.cellForModel(title:"title",content:"content",time:"2016-11-24")
        return cell!
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataScoure?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LMMessageListCell.heightWithCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
