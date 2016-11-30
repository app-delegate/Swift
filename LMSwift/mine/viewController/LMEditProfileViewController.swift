//
//  LMEditProfileViewController.swift
//  LMSwift
//
//  Created by YUMO on 16/11/28.
//  Copyright © 2016年 YUMO. All rights reserved.
//

import UIKit

class LMEditProfileViewController: LMBaseViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    var tableView:UITableView?
    var image:UIImage?
    var array:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        array = [["昵称","Qly"],["性别","女"]]

        image = UIImageWithName(name: "touxiang")
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: NAVIGATION_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        self.view.addSubview(tableView!)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return LMEditHeadImageCell.height()
        } else {
            return LMEditTableViewCell.height()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: LMEditHeadImageCell.reuseIdentifier()) as? LMEditHeadImageCell

            if (cell==nil) {
                cell = LMEditHeadImageCell.init(style: .default, reuseIdentifier: LMEditHeadImageCell.reuseIdentifier())
                cell?.selectionStyle = .none
            }
            
            cell?.refresh(image:image!)
            return cell!
            
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: LMEditTableViewCell.reuseIdentifier()) as? LMEditTableViewCell
            if cell == nil {
                cell = LMEditTableViewCell.init(style: .default, reuseIdentifier: LMEditTableViewCell.reuseIdentifier())
                cell?.selectionStyle = .none
            }
            
            let arr = array?.object(at:indexPath.row - 1)
            cell?.refresh(titleStr: (arr as AnyObject).object(at: 0) as! String,contentStr: (arr as AnyObject).object(at: 1) as! String)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            weak var _self = self
            
            let sheet = UIAlertController.init(title: "", message: "提示", preferredStyle: .actionSheet)
            
            sheet.addAction(UIAlertAction.init(title: "取消", style:.cancel, handler: nil))
            
            sheet.addAction(UIAlertAction.init(title: "从相册选择", style: .default, handler: { (UIAlertAction) in
                if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    return
                }
                //2.创建照片控制器
                let picVc = UIImagePickerController()
                //3.设置控制器类型
                picVc.sourceType = .photoLibrary
                //4.设置是否可以管理已经存在的图片或者视频
                picVc.allowsEditing = true
                //5.设置代理
                picVc.delegate = _self
                //6.弹出控制器
                _self?.present(picVc, animated: true, completion: nil)
            }))
            
            let alert = UIAlertController.init(title: "提示", message: "无法启动照相机", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
            sheet.addAction(UIAlertAction.init(title: "拍照", style: .default, handler: { (UIAlertAction) in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    let picker = UIImagePickerController()
                    picker.delegate = _self
                    picker.sourceType = .camera
                    picker.allowsEditing = true
                    _self?.present(picker, animated: true, completion: nil)
                } else {
                    self.present(alert, animated: true, completion: nil)
                }
            }))
            
            self.present(sheet, animated: true, completion:nil)
            
        } else if (indexPath.row == 1){
            
            let vc = LMEditNickNameViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            weak var _self = self
            let sheet = UIAlertController.init(title: "", message: "选择性别", preferredStyle: .actionSheet)
            sheet.addAction(UIAlertAction.init(title: "男", style: .default, handler: { (UIAlertAction) in
                _self?.array = [["昵称","Qly"],["性别","男"]]
                _self?.tableView?.reloadData()
            }))
            
            sheet.addAction(UIAlertAction.init(title: "女", style: .default, handler: { (UIAlertAction) in
                _self?.array = [["昵称","Qly"],["性别","女"]]
                _self?.tableView?.reloadData()
            }))
            
            sheet.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
            self.present(sheet, animated: true, completion: nil)
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        let img = info[UIImagePickerControllerOriginalImage]as?UIImage
        image = img
        picker.dismiss(animated: true, completion: nil)
        tableView?.reloadData()
        
//        let img:UIImage? = info[UIImagePickerControllerEditedImage] as! UIImage
        
//            //显示的图片
//            let image:UIImage!
//            if editSwitch.isOn {
//                    //获取编辑后的图片
//                    image = info[UIImagePickerControllerEditedImage] as! UIImage
//                }else{
//                    //获取选择的原图
//                    image = info[UIImagePickerControllerOriginalImage] as! UIImage
//                }
//             
//            imageView.image = image
//            //图片控制器退出
//            picker.dismiss(animated: true, completion: {
//                    () -> Void in
//                })

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
